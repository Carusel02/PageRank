# Pagerank search algorithm
`PageRank` (PR) is an algorithm used by Google Search to rank web pages in their search engine results. It is named after both the term "web page" and co-founder Larry Page. PageRank is a way of measuring the importance of website pages. 

### Requirement
1. `ITERATIVE`
- Reading the file with fscanf and forming the adjacency matrix
- Ensuring that we exclude the node that accesses itself
- The elements on the diagonal should be 0
- Calculation of the initial PR vector
- Calculation of the PR vector up to a condition
- Retrieving formulas according to wikipedia
 
2. `ALGEBRAIC`
- The same reading as in the previous step
- Formation of the matrix
- Decomposition of the matrix in the form Q R (Gram Schimdt)
- Solving an upper triangular system
- Retrieving formulas according to wikipedia

3. `GRADE`
- Sort the PR vector from the Algebraic algorithm with the simple Bubblesort function
- Return sorted vector and node vector
- Implementation of the Membership function

### Testing
Run the `Pagerank` function from the command line and notice that the files graf1.out and graf2.out are good.
