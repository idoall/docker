# V8 Bindings for Go [![Build Status](https://travis-ci.org/augustoroman/v8.svg?branch=master)](https://travis-ci.org/augustoroman/v8) [![Go Report Card](https://goreportcard.com/badge/github.com/augustoroman/v8)](https://goreportcard.com/report/github.com/augustoroman/v8) [![GoDoc](https://godoc.org/github.com/augustoroman/v8?status.svg)](https://godoc.org/github.com/augustoroman/v8)

The v8 bindings allow a user to execute javascript from within a go executable.

The bindings are tested to work with several recent v8 builds matching the
Chrome builds 54 - 60 (see the .travis.yml file for specific versions). For
example, Chrome 59 (dev branch) uses v8 5.9.211.4 when this was written.

Note that v8 releases match the Chrome release timeline:
Chrome 48 corresponds to v8 4.8.\*, Chrome 49 matches v8 4.9.\*. You can see
the table of current chrome and the associated v8 releases at:

http://omahaproxy.appspot.com/
