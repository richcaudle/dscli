# Dscli

DSCLI is a command line wrapper around the DataSift API Client Library for Ruby.
It was built by the DataSift Support Team to help speed up tasks we found ourselves frequently repeating.

## Installation

This tool was intended for use as a CLI tool only:

    gem install dscli

## Usage

First, call ``` dscli config ``` to enter your DataSift API credentials. This will store your username and API key in a new file called ~/.datasiftcli. 
You should then be free to use any of following commands:

    dscli balance              # Gets your current plan and balance
    dscli compile (csdl)       # Compile CSDL
    dscli config               # Configure your DataSift API credentials
    dscli dpu (hash)           # Find the DPU cost of a given stream hash
    dscli help [COMMAND]       # Describe available commands or one specific command
    dscli historics <command>  # Run commands relating to historics
    dscli push <command>       # Run commands relating to push subscriptions
    dscli source <command>     # Run commands relating to managed sources
    dscli stream (hash)        # Stream interactions from a DataSift stream to the command line
    dscli usage [period]       # Find your stream and license fee usage


## Example Usage

    $ dscli compile 'interaction.content contains "coffee"'
    => ce9d18e45a53dfa2dfde7747f8c5d98b

## Contributing

Contributions are always appreciated!

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
