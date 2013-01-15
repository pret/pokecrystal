from bisect import bisect_left, bisect_right
from itertools import izip

class IntervalMap(object):
    """
    This class maps a set of intervals to a set of values.

    >>> i = IntervalMap()
    >>> i[0:5] = "hello world"
    >>> i[6:10] = "hello cruel world"
    >>> print i[4]
    "hello world"
    """

    def __init__(self):
        """initializes an empty IntervalMap"""
        self._bounds = []
        self._items = []
        self._upperitem = None

    def __setitem__(self, _slice, _value):
        """sets an interval mapping"""
        assert isinstance(_slice, slice), 'The key must be a slice object'

        if _slice.start is None:
            start_point = -1
        else:
            start_point = bisect_left(self._bounds, _slice.start)

        if _slice.stop is None:
            end_point = -1
        else:
            end_point = bisect_left(self._bounds, _slice.stop)

        if start_point>=0:
            if start_point < len(self._bounds) and self._bounds[start_point]<_slice.start:
                start_point += 1

            if end_point>=0:
                self._bounds[start_point:end_point] = [_slice.start, _slice.stop]
                if start_point < len(self._items):
                    self._items[start_point:end_point] = [self._items[start_point], _value]
                else:
                    self._items[start_point:end_point] = [self._upperitem, _value]
            else:
                self._bounds[start_point:] = [_slice.start]
                if start_point < len(self._items):
                    self._items[start_point:] = [self._items[start_point], _value]
                else:
                    self._items[start_point:] = [self._upperitem]
                self._upperitem = _value
        else:
            if end_point>=0:
                self._bounds[:end_point] = [_slice.stop]
                self._items[:end_point] = [_value]
            else:
                self._bounds[:] = []
                self._items[:] = []
                self._upperitem = _value

    def __getitem__(self,_point):
        """gets a value from the mapping"""
        assert not isinstance(_point, slice), 'The key cannot be a slice object'

        index = bisect_right(self._bounds, _point)
        if index < len(self._bounds):
            return self._items[index]
        else:
            return self._upperitem

    def items(self):
        """returns an iterator with each item being
        ((low_bound, high_bound), value)
        these items are returned in order"""
        previous_bound = None
        for (b, v) in izip(self._bounds, self._items):
            if v is not None:
                yield (previous_bound, b), v
            previous_bound = b
        if self._upperitem is not None:
            yield (previous_bound, None), self._upperitem

    def values(self):
        """returns an iterator with each item being a stored value
        the items are returned in order"""
        for v in self._items:
            if v is not None:
                yield v
        if self._upperitem is not None:
            yield self._upperitem

    def __repr__(self):
        s = []
        for b,v in self.items():
            if v is not None:
                s.append('[%r, %r] => %r'%(
                    b[0],
                    b[1],
                    v
                ))
        return '{'+', '.join(s)+'}'

