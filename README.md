# Dscli

DSCLI is a command line wrapper around the DataSift API Client Library for Ruby.
It was built by the DataSift Support Team to help speed up tasks we found ourselves frequently repeating.
Version 0.0.1 offers support for only some of the core API functions. Support for the Push and Historics APIs is on it's way.

## Installation

This tool was intended for use as a CLI tool only:

    gem install dscli

## Usage

First, call ``` dscli config ``` to enter your DataSift API credentials. This will store your username and API key in a new file called ~/.datasiftcli
You should then be free to use any of following commands:

    dscli compile (csdl)  # Compile CSDL
    dscli config          # Configure your DataSift API credentials
    dscli dpu (hash)      # Find the DPU cost of a given stream hash
    dscli help [COMMAND]  # Describe available commands or one specific command
    dscli stream (hash)   # Stream interactions from a DataSift stream to the command line
    dscli usage [period]  # Find your stream and license fee usage

## Contributing

Contributions are always appreciated!

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
