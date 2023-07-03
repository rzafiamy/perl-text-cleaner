# Text Cleanup Script

The Text Cleanup Script is a Perl script that applies find and replace operations using regular expressions to clean up text files. It reads an input file, applies a set of regex patterns specified in a configuration file, and writes the cleaned-up text to an output file.

## Prerequisites

- Perl (version 5.10 or higher)

## Usage

1. Clone the repository or download the `cleaner.pl` script.

2. Create a configuration file (`config.ini`) with the desired find and replace patterns. Each pattern should be in the format `s/<pattern>/<replacement>/`, with one pattern per line. 

Lines starting with `#` will be treated as comments.

   Example configuration file:

```plaintext
   # Cleanup configuration file
   # Format: s/<pattern>/<replacement>/

   # Replace é with e
   s/é/e/g

   # Replace à and â with a
   s/[àâ]/a/g

   # Replace ç with c
   s/ç/c/g
```

Open a terminal or command prompt and navigate to the directory where the cleaner.pl script is located.

Run the script with the following command:

```shell

    perl cleanup_script.pl <input_file> <output_file> <config_file>
```

    Replace <input_file>, <output_file>, and <config_file> with the actual file paths or names.
    The cleaned-up text will be written to the specified output file.


## Notes

    The script performs find and replace operations using regular expressions. Ensure that the regex patterns in the configuration file are correctly formatted and tested before running the script.
    The script supports basic regex.
    Make sure the input file exists and the output file is not the same as the input file to avoid data loss.

## License

This project is licensed under the MIT License.
Feel free to modify the content of the `README.md` file according to your needs and add any additional sections or information.
