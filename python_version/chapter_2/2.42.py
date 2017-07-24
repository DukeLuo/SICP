#! usr/bin/env python
# -*- coding: utf-8 -*-
# Exercise 2.42

def conflict(position):
    for i in range(len(position)-1):
        if abs(position[-1] - position[i])in (0,len(position)-(i+1)):
            return True
    return False

def adjoin_position(new_row,position):
    position += [new_row]
    return position

def queens(board_size):
    def queen_cols(k):
        if k == 0:
            return [[]]
        else:
            all_new_positions = []
            rest = queen_cols(k-1)
            for position in rest:
                new_positions_of_one = []
                for new_row in range(1,board_size+1):
                    L = position[:]
                    new_position = adjoin_position(new_row,L)
                    new_positions_of_one.append(new_position)
                all_new_positions += new_positions_of_one
            return filter(lambda x: not conflict(x),all_new_positions)
    return queen_cols(board_size)

