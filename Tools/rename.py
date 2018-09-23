#!/usr/local/bin/python

__description__ = 'Python Rename Tool'
__author__ = 'Gustavo Tavares'
__version__ = '0.0.1'
__date__ = '2018/03/27'

"""
Source code put in public domain by Gustavo Tavares, no Copyright
Use at your own risk

History:
  2018/03/27: start

Todo:
"""

import argparse
import os

def parseArgs():

    parser = argparse.ArgumentParser("Simple renaming tool")
    parser.add_argument("-c", "--change", help="String to be replaced", required=True)
    parser.add_argument("-n", "--new", help="New Value")
    parser.add_argument("-d", "--dir", help="Root Folder")
    parser.add_argument("-r", "--recursive", help="Recursive scan", action="store_true")
    parser.add_argument("-v", "--verbose", help="Show filenames to be changed before Confirmation", action="store_true")

    return parser.parse_args()

def walk(dirname):

    relacao = []

    for root, dirs, files in os.walk(dirname, topdown=False):
        for name in files:
            relacao.append(os.path.join(root, name))
    
    return relacao

def list(dirname):
    fnames = os.listdir(dirname)
    return fnames

def filter(lista, value):

    filtered = []

    for element in lista:
        if value.lower() in element.lower():
            filtered.append(element)
    
    return filtered

args = parseArgs()

dir = args.dir if args.dir != None else "."
lista = walk(dir) if args.recursive else list(dir)
filtered = filter(lista, args.change)

print("\n")
if args.verbose:
    print("Files to be renamed:\n")
    for filename in filtered:
        print(filename)
        print("\n")

print("Items total: " + str(len(lista)) + "; Items Selected to be updated: " + str(len(filtered)) + "\n")

willRename = input("Confirm? [Y/N]")

if willRename in ("Y", "y", "S", "s"):

    oldValue = args.change
    newValue = "" if args.new == None else args.new 

    count = 0
    for filename in filtered:
        os.rename(filename, filename.replace(oldValue, newValue, 1))
        count = count + 1
    
    print(str(count) + " filenames changed!")
    print("Bye!") 

else:
    print("Ok, leaving without work...")
    print("Bye!") 