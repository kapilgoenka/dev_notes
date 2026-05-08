# GREP

## -c flag

* The -c flag in grep stands for "count" and makes grep output the count of matching lines instead of the actual matching lines themselves.

* Behavior:
    * Instead of printing each matching line, grep prints the number of lines that match the pattern
    * For each file searched, it outputs the filename followed by a colon and the count
    * If only one file is searched, it outputs just the number
    * Note: The count is the number of lines that match, not the total number of matches. If a pattern appears multiple times on the same line, it only counts as 1.

* Example:
    ```bash
    # Without -c: shows matching lines
    
      # Plain grep
    
          $ grep "error" app.log
        
          # Output: 
        
          # error: connection failed
          # error: timeout occurred
          # error: invalid input
    
      # With -c: shows count of matches
    
          $ grep -c "error" app.log
        
          # Output: 3
    
      # With multiple files:
    
          $ grep -c "TODO" *.py
        
          # Output:
        
          # app.py:5
          # utils.py:12
          # models.py:3
    ```

<br>

## -c flag combined with -v flag

* When you combine -c (count) with -v (invert match), grep counts the number of lines that do NOT match the pattern

* So essentially: -c alone = "count matches", -cv together = "count non-matches"

```bash
Example:

  # Count lines that DON'T contain "error"

    $ grep -cv "error" app.log
    
      # If app.log has 100 lines total and 3 contain "error", output: 97
  
  # Count non-empty lines (invert match on empty lines)

    $ grep -cv "^$" file.txt

```

<br>

## -i flag

* The -i flag in grep stands for "ignore case" and makes the search case-insensitive

