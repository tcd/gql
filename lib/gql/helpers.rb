require "json"

module Gql

  # Read a TSV file and return its contents as an array of hashes.
  #
  # @param filepath [String] Path to the TSV file.
  # @return [Array<Hash>]
  def self.data_from_tsv_file(filepath)
    return CSV.read(
      filepath,
      col_sep: "\t",
      headers: true,
      header_converters: :symbol,
    ).map(&:to_hash)
  end

  # Return a hash with symbolized keys parsed from a given JSON file.
  #
  # @param file [String]
  # @return [Hash<Symbol>]
  def self.parse_json(file)
    return JSON.parse(File.read(file), symbolize_names: true)
  end

  # Append data to the end of a file.
  # The file is created if it doesn't exist.
  #
  # @param file [String] Path to the file.
  # @param data [String,#to_s] Data to write to the file.
  # @return [void]
  def self.write_to_file(file, data)
    FileUtils.mkdir_p(File.dirname(file))
    File.open(file, "a") do |f|
      f.write(data)
    end
  end

  # Directory where the gem is located.
  # @return [String]
  def self.root_dir
    return File.expand_path("../../..", __FILE__)
  end

  # Directory for writing out files.
  # @return [String]
  def self.data_dir
    return File.join(self.root_dir, "data")
  end

  # Directory for writing out files.
  # @return [String]
  def self.tmp_dir
    return File.join(self.root_dir, "tmp")
  end

  # @param path [String]
  # @return [String]
  def self.unique_filename(path)
    # Return the path if there is no file there.
    return path unless File.file?(path)
    # Otherwise, add numbers to the end until we get an unused name.
    # Define these outside of the loop so the functions aren't called on every iteration.
    base = File.basename(path, ".*")
    extension = File.extname(path)
    dir = File.dirname(path)
    (2..).each do |i|
      new_name = File.join(dir, (base + "-#{i}" + extension))
      return new_name unless File.file?(new_name)
    end
  end

end

class String
  # Same as {indent}, except it indents the receiver in-place.
  #
  # Returns the indented string, or `nil` if there was nothing to indent.
  #
  # @param amount [Integer] The level of indentation to add.
  # @param indent_string [String] Defaults to tab if a tab is present in the string, and `" "` otherwise.
  # @param indent_empty_lines [Boolean]
  #
  # @return [void]
  def indent!(amount, indent_string = nil, indent_empty_lines = false)
    indent_string = indent_string || self[/^[ \t]/] || " "
    re = indent_empty_lines ? /^/ : /^(?!$)/
    gsub!(re, indent_string * amount)
  end

  # Indents the lines in the receiver.
  #
  # @example
  #   <<EOS.indent(2)
  #   def some_method
  #     some_code
  #   end
  #   EOS
  #   # =>
  #     def some_method
  #       some_code
  #     end
  #
  # The second argument, `indent_string`, specifies which indent string to
  # use. The default is `nil`, which tells the method to make a guess by
  # peeking at the first indented line, and fallback to a space if there is
  # none.
  #
  # @example
  #   "  foo".indent(2)        # => "    foo"
  #   "foo\n\t\tbar".indent(2) # => "\t\tfoo\n\t\t\t\tbar"
  #   "foo".indent(2, "\t")    # => "\t\tfoo"
  #
  # While `indent_string` is typically one space or tab, it may be any string.
  #
  # The third argument, `indent_empty_lines`, is a flag that says whether
  # empty lines should be indented. Default is `false`.
  #
  # @example
  #   "foo\n\nbar".indent(2)            # => "  foo\n\n  bar"
  #   "foo\n\nbar".indent(2, nil, true) # => "  foo\n  \n  bar"
  #
  # @param amount [Integer] The level of indentation to add.
  # @param indent_string [String] Defaults to tab if a tab is present in the string, and `" "` otherwise.
  # @param indent_empty_lines [Boolean]
  #
  # @return [String]
  def indent(amount, indent_string = nil, indent_empty_lines = false)
    dup.tap { |s| s.indent!(amount, indent_string, indent_empty_lines) }
  end
end
