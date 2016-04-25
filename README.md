# Styledown Elixir 

[![Build Status](https://semaphoreci.com/api/v1/victorsolis/styledown_ex/branches/master/badge.svg)](https://semaphoreci.com/victorsolis/styledown_ex)

Elixir integration of [Styledown](https://github.com/styledown/styledown)

## Installation

```elixir
def deps do
  [{:styledown, "~> 0.0.1"}]
end
```

## Usage

```elixir
iex> Styledown.parse("### hi")
"<section class=\"sg-block sg-section-hi\">\n  <h3 id=\"hi\" class=\"sg\">hi</h3>\n</section>"
```

## Documentation

The documentation is available [online](https://hexdocs.pm/styledown) and within the Styledown module. To build the
docs locally:

```shell
$ MIX_ENV=docs mix docs
```

## Contributing

Any contribution is welcome and appreciated. Please check the [issue
tracker](https://github.com/styledown/styledown_ex/issues) before submitting
issues and pull requests. Please ensure that the tests are passing before
submitting a pull request.

```shell
$ git clone https://github.com/styledown/styledown_ex
$ cd styledown_ex
$ mix deps.get
$ mix test
```

## License

Copyright 2016, Victor Solis. Released under the [MIT](https://github.com/styledown/styledown_ex/blob/master/LICENSE) license.

