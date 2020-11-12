val temp = Array(Array(1,2,3,4,5),Array(1,2,3,4,5))
temp.zipWithIndex.map { case (row, i) => row.zipWithIndex.map { case (element, j) => (i,j)}}