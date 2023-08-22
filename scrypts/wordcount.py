# A programme which counts the words in a file up until the word 'Bibliography by converting it to txt'

# An end function which tells you how many words

import os

def print_count(word_count):
    print("There are", word_count, "words in this file excluding the Bibliography.")
    quit()

print("This programme counts the number of words (including footnotes) in a text file up until the word 'Bibliography'.")

file = input("Enter the name of a file. ")
pdffile = file + ".pdf"

if  os.system("pdftotext " + pdffile) != 0:
 print("This programme relies on 'pdftotext'.\nPlease ensure that it is installed on this machine.")
 quit()

txtfile = file + ".txt"

# Try to open the file
try:
    fhand = open(txtfile)
except:
    print("That text file was not found.")
    quit()

word_count = 0 
line_count = 0 

linx = ""

for linx in fhand:
    linx = linx.rstrip()
    words = linx.split()    
    for item in words:
        if item == 'Bibliography' : print_count(word_count)
        line_count += 1

    word_count += line_count
    line_count = 0

print_count(word_count)


