# Assignment 4 - R Code

**Name:** Abdul Djama  
**Course:** Info-B473/573 
**Date:** November 8, 2026

## Description

In this assignment, I worked with the same DNA file from Assignment 1, but this time I used R instead of Python. 
I had to find certain bases in the sequence, make the reverse complement, and count the different bases in each 1000-base section.

## Files

- `InfoB473 Assignment 4.R` - My code for the assignment
- `chr1_GL383518v1_alt.fa.gz` - The DNA sequence file
- `kb_list.rds` - Saves the counts from each section
- `nucleotide_counts.csv` - The counts in a table

## What I Did

I started by reading the DNA file and getting rid of the first line since it wasn't part of the actual sequence. Then I combined the rest of the lines and used R to print the bases at positions 10 and 758.

For the second part, I reversed the sequence and changed the bases to their complements. After that, I printed the base at position 79 and the section from 500 to 800.

The third part was mostly using a loop to count the bases. I went through the sequence 1000 bases at a time and counted how many A's, C's, G's, and T's were in each section. I saved those numbers in a list so I could use them again.

In the fourth part, I took those counts and put them into a data frame. I also added up the numbers in each row to see if they totaled 1000. Everything added up except the last section, which only had 439 bases left.

## How to Run

Make sure the DNA file and R script are in the correct folder. Open the script in RStudio and run it from the beginning. The code reads the DNA file, prints the requested bases, and creates the files containing the counts.

## Issues

I had some trouble at first because R wasn't finding my DNA file. I had the file downloaded already, but the directory I was using wasn't working. I had to go back and check where the file was saved and make sure the name matched what I had in my code.
