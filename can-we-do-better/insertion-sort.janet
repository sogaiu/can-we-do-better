(defn insertion-sort!
  [arr]
  (def arr-len (length arr))
  (when (< arr-len 2)
    (break arr))
  # at this point there are two or more elements
  (for unsorted-idx 1 arr-len
    (def picked-elt (get arr unsorted-idx))
    (var i (dec unsorted-idx))
    (while (<= 0 i)
      (def cur-elt (get arr i))
      (if (< cur-elt picked-elt)
        (break)
        (put arr (inc i) cur-elt))
      (-- i))
    (put arr (inc i) picked-elt))
  #
  arr)

(comment

  (insertion-sort! @[])
  # =>
  @[]

  (insertion-sort! @[1])
  # =>
  @[1]

  (insertion-sort! @[1 3 2])
  # =>
  @[1 2 3]

  (insertion-sort! @[5 4 1 8 7 2 6 3])
  # =>
  @[1 2 3 4 5 6 7 8]

  (insertion-sort! @[2 3 2])
  # =>
  @[2 2 3]

  (let [n 100
        arr (seq [i :range [0 n]]
              (* n (math/random)))]
    (deep= (insertion-sort! (array ;arr))
           (sort (array ;arr))))
  # =>
  true

  )

