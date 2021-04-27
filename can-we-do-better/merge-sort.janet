(defn merge-sort
  [arr]
  (defn merge-arrays
    [left right]
    (def new-len
      (+ (length left) (length right)))
    (var i 0)
    (var j 0)
    (def new-arr (array/new new-len))
    #
    (for k 0 new-len
      (let [left-item (get left i)
            right-item (get right j)]
        (cond
          (or (not right-item)
              (< left-item right-item))
          (do
            (put new-arr k left-item)
            (++ i))
          #
          (or (not left-item)
              (>= left-item right-item))
          (do
            (put new-arr k right-item)
            (++ j)))))
    new-arr)
  #
  (defn sort-helper
    [arr]
    (def arr-len (length arr))
    (when (< arr-len 2)
      (break arr))
    # at this point there are two or more elements
    (def split-idx
      (math/floor (/ arr-len 2)))
    (def left
      (sort-helper (array/slice arr 0 split-idx)))
    (def right
      (sort-helper (array/slice arr split-idx)))
    (merge-arrays left right))
  #
  (sort-helper arr))

(comment

  (merge-sort @[])
  # => @[]

  (merge-sort @[1])
  # => @[1]

  (merge-sort @[1 3 2])
  # => @[1 2 3]

  (merge-sort @[5 4 1 8 7 2 6 3])
  # => @[1 2 3 4 5 6 7 8]

  (merge-sort @[2 3 2])
  # => @[2 2 3]

  (let [n 100
        arr (seq [i :range [0 n]]
              (* n (math/random)))]
    (deep= (merge-sort (array ;arr))
           (sort (array ;arr))))
  # => true

  )
