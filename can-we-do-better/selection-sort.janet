(defn selection-sort!
  [arr]
  (def arr-len (length arr))
  (when (< arr-len 2)
    (break arr))
  # at this point there are two or more elements
  (for unsorted-idx 0 arr-len
    (var min-pair nil)
    (for i unsorted-idx arr-len
      (def item (get arr i))
      (if-not min-pair
        (set min-pair [i item])
        (when (< item (get min-pair 1))
          (set min-pair [i item]))))
    (let [elt (get arr unsorted-idx)
          [min-idx min-item] min-pair]
      (put arr unsorted-idx min-item)
      (put arr min-idx elt)))
  #
  arr)

(comment

  (selection-sort! @[])
  # =>
  @[]

  (selection-sort! @[1])
  # =>
  @[1]

  (selection-sort! @[1 3 2])
  # =>
  @[1 2 3]

  (selection-sort! @[5 4 1 8 7 2 6 3])
  # =>
  @[1 2 3 4 5 6 7 8]

  (selection-sort! @[2 3 2])
  # =>
  @[2 2 3]

  (let [n 100
        arr (seq [i :range [0 n]]
              (* n (math/random)))]
    (deep= (selection-sort! (array ;arr))
           (sort (array ;arr))))
  # =>
  true

  )

