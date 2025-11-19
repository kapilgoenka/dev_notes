# Python Testing




## capsys (pytest)


capsys is a built-in pytest fixture that captures writes to sys.stdout and sys.stderr.
It allows you to test functions that print to the console by capturing their output
and making assertions about it. This is particularly useful for testing CLI
applications, where console output is a primary feature to verify.

Key points: 1. Automatic injection: Just add capsys as a parameter to your test
function - pytest automatically provides it (this is called dependency injection) 2.
readouterr() method: Returns a named tuple with two attributes: - captured.out -
everything written to stdout - captured.err - everything written to stderr 3. Each
call to readouterr() returns the captured text since the last call and resets the
buffer.



## pytest.raises() (pytest)


pytest.raises() is a "context manager" that verifies a specific exception is raised
within a block of code. If the expected exception is NOT raised, the test fails.

pytest.raises() makes your test explicitly state "I expect this code to fail with this
specific exception" - which is important for testing error handling and validation
logic.

Why does this test use SystemExit?

```python
def test_parse_args_missing_breed(self): """Test missing breed argument""" with
```

patch("sys.argv", ["main.py"]):  # Simulate running with no arguments with
pytest.raises(SystemExit):    # Expect SystemExit to be raised parse_args() # This
will fail because breed is required

When argparse encounters invalid arguments (like missing required arguments), it:
```python
	1. Prints an error message
```

  2. Prints the help message
```python
  3. Calls sys.exit(2) which raises SystemExit
```


Context managers in python are objects that define setup and cleanup behavior.

```python
  How pytest.raises() works as a context manager
```

```python
  with pytest.raises(SystemExit):
      parse_args()  # Code that should raise SystemExit
```

```python
  Here's what happens step by step:
```

```python
    1. BEFORE the block: pytest sets up exception monitoring
    2. DURING the block: pytest watches for the SystemExit exception
    3. AFTER the block: pytest checks:
      - ✅ If SystemExit was raised → Test PASSES
      - ❌ If NO exception was raised → Test FAILS
      - ❌ If DIFFERENT exception was raised → Test FAILS
```



