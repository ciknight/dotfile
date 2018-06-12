#!/usr/bin/env python
# -*- coding: utf-8 -*-

def calculate_time(s):
    m, s = s // 60, s % 60
    h, m = m // 60, m % 60
    d, h = h // 24, h % 24
    return d, h, m, s
