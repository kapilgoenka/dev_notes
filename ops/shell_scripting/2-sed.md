# SED

* sed is a powerful command-line utility for parsing and transforming text in a stream (file or pipeline). It processes text line-by-line and applies editing commands.

* sed is extremely powerful for text processing, especially in shell scripts and pipelines for automated text transformations.

*   Tips

    * Always test without -i first - Preview changes before modifying files

    * Use quotes - Single quotes prevent shell interpretation

    * Escape special characters - Use backslash for literal /, &, etc.

    * Change delimiter - Use different delimiter if pattern contains /:

    * Instead of: sed 's/\/path\/to\/file/\/new\/path/g'

    * Use: sed 's|/path/to/file|/new/path|g'

* Common Commands

    * Substitution (most common use)

        ```bash
        # Basic substitution: replace first occurrence per line
        sed 's/old/new/' file.txt
        
        # Global substitution: replace all occurrences per line
        sed 's/old/new/g' file.txt
        
        # Replace only on specific line number
        sed '3s/old/new/' file.txt
        
        # Replace in a range of lines
        sed '1,5s/old/new/g' file.txt
      ```
      
    * Delete Lines

        ```bash
        # Delete specific line
        sed '3d' file.txt
        
        # Delete range of lines
        sed '1,5d' file.txt
        
        # Delete lines matching pattern
        sed '/pattern/d' file.txt
        
        # Delete empty lines
        sed '/^$/d' file.txt
      ```

    * Print Lines

        ```bash
        # Print specific line (use -n to suppress default output)
        sed -n '5p' file.txt
        
        # Print range of lines
        sed -n '10,20p' file.txt
        
        # Print lines matching pattern
        sed -n '/pattern/p' file.txt
        ```

    * Insert and Append

        ```bash
        # Insert line before line 3
        sed '3i\New line text' file.txt
        
        # Append line after line 3
        sed '3a\New line text' file.txt
        ```

    * `$ sed -n '1,5p' group` is the same as `$ head -5 group `

* List all running processes with full format listing for each process

    * ps -ef

    * ps command will print the running processes, -e will select all the processes from system and -f will provide full-format listing for every process running on system

* top commadn

    * `top` is an interactive command-line utility that provides a real-time, dynamic view of running processes and system resource usage. It displays CPU, memory, and other system metrics.

* curl vs wget

    * Both curl and wget are command-line tools for transferring data over networks, but they have different designs and strengths.

    * Key Philosophical Differences
        
        * curl - Library-focused, supports many protocols, designed for scripting and automation
        
        * wget - Download-focused, great for recursive downloads, simpler for basic file downloads

    * Bottom Line
    
        * For downloading files: Use wget - it's simpler and more reliable
    
        * For API work and scripting: Use curl - it's more flexible and powerful
    
        * For recursive downloads: Use wget - it's built for this
    
        * For piping to other commands: Use curl - stdout is default
        
    * Basic File Download (Winner: wget (easier for basic downloads, saves by default))

        ```bash
        * wget
            
            # Simple download (saves to original filename)
            wget https://example.com/file.zip
                
            # Download with custom name
            wget -O myfile.zip https://example.com/file.zip
                
            # Download in background
            wget -b https://example.com/largefile.iso
            
        * curl
            
            # Display output to stdout (default)
            curl https://example.com/file.zip
                
            # Save to file (must specify -O or -o)
            curl -O https://example.com/file.zip     # Use remote filename
            curl -o myfile.zip https://example.com/file.zip   # Custom name
        ```

    * Recursive/Mirror Downloads (Winner: wget (excellent for recursive downloads)

        ```bash
        * wget
        
            # Download entire website recursively
            wget -r -p -k https://example.com
            
            # Mirror a website
            wget --mirror --convert-links --adjust-extension --page-requisites \
               --no-parent https://example.com
            
            # Download all PDFs from a site
            wget -r -A.pdf https://example.com
        
        * curl
        
            No built-in recursive download support.
        ```
        
    * Output Handling (Winner: curl (better for piping and stdout operations)
    
        ```bash
        * curl
        
            # Output to stdout (default - can pipe)
            curl https://api.example.com/data | jq .
            
            # Silent mode (no progress bar)
            curl -s https://example.com
            
            # Show only HTTP headers
            curl -I https://example.com
            
            # Verbose output (see full request/response)
            curl -v https://example.com
        
        * wget
        
            # Always saves to file by default
            # Redirect to stdout with -O -
            wget -O - https://api.example.com/data | jq .
            
            # Quiet mode
            wget -q https://example.com
            
            # Show response headers
            wget -S https://example.com
        ```
        
    * Authentication (Winner: Tie (both support common auth methods)

        ```bash
        * curl
        
            # Basic auth
            curl -u username:password https://example.com
            
            # Bearer token
            curl -H "Authorization: Bearer token" https://api.example.com
            
            # Certificate-based auth
            curl --cert client.pem --key key.pem https://example.com
        
        * wget
        
            # Basic auth
            wget --user=username --password=password https://example.com
            
            # HTTP auth
            wget --http-user=username --http-password=password https://example.com
            
            # Certificate auth
            wget --certificate=client.pem --private-key=key.pem https://example.com
        ```

    * Error Handling and Retries (Winner: wget (better default retry behavior)

        ```bash
        * wget
        
            # Retry downloads (default: 20 times)
            wget --tries=10 https://example.com/file.zip
            
            # Retry with wait time between attempts
            wget --waitretry=5 https://example.com/file.zip
        
        * curl
        
            # Retry on failure
            curl --retry 5 --retry-delay 3 https://example.com/file.zip
            
            # Fail silently on server errors
            curl -f https://example.com/file.zip
        ```
        
* uname

    * uname (Unix Name) is a command-line utility that prints system information about the current operating system and hardware.

* df

    * df command displays the disk space utilization in the file system
