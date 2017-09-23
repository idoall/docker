package snowflake

import (
	"testing"
)

func TestMask(t *testing.T) {
	tests := map[uint]int64{
		1: 0x1,
		2: 0x3,
		3: 0x7,
		4: 0xf,
		5: 0x1f,
		6: 0x3f,
		7: 0x7f,
		8: 0xff,
	}

	for b, m := range tests {
		if v := mask(b); v != m {
			t.Errorf("expected %v; got %v\n", m, v)
		}
	}
}

func TestIdNReturnsUniqueValues(t *testing.T) {
	for serverBits := 2; serverBits <= 4; serverBits++ {
		for sequenceBits := 2; sequenceBits <= 4; sequenceBits++ {
			verifyUnique(t, uint(serverBits), uint(sequenceBits))
		}
	}
}

func verifyUnique(t *testing.T, serverBits, sequenceBits uint) {
	generator := NewFactory(FactoryOptions{
		ServerBits:   serverBits,
		SequenceBits: sequenceBits,
	})
	n := 4096
	rounds := 1024
	allIds := make([][]int64, 0, rounds)

	for i := 0; i < rounds; i++ {
		ids := generator.IdN(n)
		allIds = append(allIds, ids)
	}

	unique := map[int64]struct{}{}
	for _, ids := range allIds {
		if v := len(ids); v != n {
			t.Errorf("expected %v; got %v\n", n, v)
		}
		for _, id := range ids {
			unique[id] = struct{}{}
		}
	}

	expected := n * rounds
	if v := len(unique); v != expected {
		t.Errorf("expected %v; got %v\n", expected, v)
		return
	}
}
