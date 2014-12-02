# GeektoolKit

GeektoolKit is a tool for generating and running geeklets.

## Installation

The shebang for all the scripts is '#!/usr/bin/env ruby' and Geektool runs scripts without regard to your ruby version manager, so you will want to run

    $ sudo gem install geektool_kit

using your system ruby. If you are using rvm, that means you will want to run

    $ rvm use system

before you run any scripts.

## Usage

To create the config file and generate the geeklets (in ~/geektool_kit)

    $ geektool_kit setup

Once the geeklets have been generated, double-clicking their .glet files will add them to Geektool.

To preview the output for the cpu_meter geeklet:

    $ gk_cpu_meter
    $ gk_cpu_meter [-l lines_to_print] [-t "alternate title"]

To preview the output for the mem_meter geeklet:

    $ gk_mem_meter
    $ gk_mem_meter [-l lines_to_print] [-t "alternate title"]

To preview the output for the cal geeklet:

    $ gk_cal


## Contributing

1. Fork it ( https://github.com/[my-github-username]/geektool_kit/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
