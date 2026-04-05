defmodule Osworks.Cldr do
  use Cldr,
    locales: ["en", "en-IN"],
    default_locale: "en-IN",
    providers: [Cldr.Number, Money.Backend]
end
