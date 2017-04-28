from yum.plugins import PluginYumExit, TYPE_CORE, TYPE_INTERACTIVE
from urlparse import urljoin
import os,time

requires_api_version = '2.3'
plugin_type = (TYPE_CORE, TYPE_INTERACTIVE)

enablesize=300000
trymirrornum=-1
maxconn=10
httpdownloadonly=False
cleanOnException=0

def init_hook(conduit):
	global enablesize,trymirrornum,maxconn,cleanOnException,httpdownloadonly
	enablesize = conduit.confInt('main','enablesize',default=30000)
	trymirrornum = conduit.confInt('main','trymirrornum',default=-1)
	maxconn = conduit.confInt('main','maxconn',default=10)
	httpdownloadonly=conduit.confBool('main','onlyhttp',default=False)
	cleanOnException=conduit.confInt('main','cleanOnException',default=0)
	return

def predownload_hook(conduit):
	global enablesize,cleanOnException,httpdownloadonly
	preffermirror=""
	PkgIdx=0
	TotalPkg=len(conduit.getDownloadPackages())
	for po in (conduit.getDownloadPackages()):
		PkgIdx+=1
		if hasattr(po, 'pkgtype') and po.pkgtype == 'local':
			continue
		totsize = long(po.size)
		ret = False
		if totsize <= enablesize:
			conduit.info(2, "Package %s download size %d less than %d,Skip plugin!"  % (po.repo.id,totsize,enablesize))
			continue
		else:
			conduit.info(2, "[%d/%d]Ok,we will try to use axel to download this big file:%d" % (PkgIdx,TotalPkg,totsize))
		local = po.localPkg()
		if os.path.exists(local):
			if not os.path.exists(local+".st"):
				fstate=os.stat(local)
				if totsize == fstate.st_size:
					conduit.info(2,"Target already exists,skip to next file!")
					continue
		localall = "%s %s" % (local,local+".st")
		rmcmd = "rm -f %s" % (localall)
		curmirroridx = 0
		conduit.info(2,"Before we start,clean all the key files")
		os.system(rmcmd)
		connnum = totsize / enablesize
		if connnum*enablesize<totsize:
			connnum+=1
		if connnum > maxconn:
			connnum = maxconn
		mirrors=[]
		mirrors[:0]=po.repo.urls
		if preffermirror != "":
			mirrors[:0] = [preffermirror]
		for url in mirrors:
			if url.startswith("ftp://") and httpdownloadonly:
				print "Skip Ftp Site:",url
				continue
			if url.startswith("file://"):
				print "Skip Local Site:",url
				continue
			curmirroridx += 1
			if (curmirroridx > trymirrornum) and (trymirrornum != -1):
				conduit.info(2, "Package %s has tried %d mirrors,Skip plugin!" % (po.repo.id,trymirrornum))
				break
			remoteurl =  "%s/%s" % (url,po.remote_path)
			syscmd = "axel -a -n %s %s -o %s" % (connnum,remoteurl,local)
			conduit.info(2, "Execute axel cmd:\n%s"  % syscmd)
			os.system(syscmd)
			time.sleep(2)
			if os.path.exists(local+".st"):
				conduit.info(2,"axel exit by exception,let's try another mirror")
				if cleanOnException:
					conduit.info(2,"because cleanOnException is set to 1,we do remove key file first")
					os.system(rmcmd)
				continue
			elif not os.path.exists(local):#this mirror may not update yet
				continue
			else:
				ret = True
				preffermirror=url
				break
		if not ret:
			conduit.info (2,"try to run rm cmd:%s"  % rmcmd)
			os.system(rmcmd)
