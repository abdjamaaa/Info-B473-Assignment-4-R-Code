# Abdul Djama
# Info-B473/573
# 11/8/2026
# Assignment 4 R 

# Read the complete DNA sequence file

dna_file <- gzfile("chr1_GL383518v1_alt.fa.gz", "rt")
lines <- readLines(dna_file)
close(dna_file)

# Remove the FASTA header
lines <- lines[-1]

# Combine all lines into one sequence
dna <- paste(lines, collapse = "")
dna <- toupper(dna)

# Separate the sequence into individual letters
bases <- strsplit(dna, "")[[1]]

# Print the 10th and 758th letters
print(bases[10])
print(bases[758])


#The reverse complement

reverse_bases <- rev(bases)
complement <- reverse_bases

complement[reverse_bases == "A"] <- "T"
complement[reverse_bases == "T"] <- "A"
complement[reverse_bases == "C"] <- "G"
complement[reverse_bases == "G"] <- "C"

# Print the 79th letter
print(complement[79])

# Print letters 500 through 800
print(paste(complement[500:800], collapse = ""))



# Nucleotide count in every kilobase

sequence_length <- length(bases)
num_kb <- ceiling(sequence_length / 1000)

# empty list
kb_list <- list()

for (i in 1:num_kb) {
  
  start <- (i - 1) * 1000 + 1
  end <- min(i * 1000, sequence_length)
  
  section <- bases[start:end]
  
  # Count each nucleotide
  A <- sum(section == "A")
  C <- sum(section == "C")
  G <- sum(section == "G")
  T <- sum(section == "T")
  
  kb_list[[i]] <- c(A = A, C = C, G = G, T = T)
}

# Print the list
print(kb_list)

# Save the list for Part 4
saveRDS(kb_list, "kb_list.rds")


# Read the list created in Part 3

kb_list <- readRDS("kb_list.rds")

# Create a data frame with four columns
counts <- data.frame(
  A = numeric(0),
  C = numeric(0),
  G = numeric(0),
  T = numeric(0)
)

# Add each kilobase as a new row
for (i in 1:length(kb_list)) {
  
  new_row <- data.frame(
    A = kb_list[[i]]["A"],
    C = kb_list[[i]]["C"],
    G = kb_list[[i]]["G"],
    T = kb_list[[i]]["T"]
  )
  
  counts <- rbind(counts, new_row)
}

rownames(counts) <- paste0("KB_", 1:nrow(counts))

# Print the first 1000 base pairs
print(counts[1, ])

# Print all kilobases
print(counts)

# Calculate the sum of each row
row_totals <- rowSums(counts)

print(row_totals)

# Identify rows whose totals are not 1000
print(which(row_totals != 1000))

# Add totals to the data frame
counts$Total <- row_totals

# Print final data frame
print(counts)

# Save results
write.csv(counts, "nucleotide_counts.csv")


# Part 4e: Questions

# 1) What is the expected sum for each list?
# The expected sum of this would be 1000 because each kilobase
# contains 1000 nucleotides.

# 2) Are there any lists whose sums are different?
# Yes, the last kilobase has a sum of 439 instead
# of 1000. All other kilobases have a sum of 1000.

# 3) Explain the differences.
# The DNA sequence contains 182439 nucleotides
# This gives 182 complete kilobases since they all contain 1000 nucleotides.
# But the incomplete set has the remaining 439 nucleotides.
# Since the last section is shorter than 1000
# bases, its total is also smaller.



