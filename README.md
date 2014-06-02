[![Gem Version](https://badge.fury.io/rb/vakit.png)](http://badge.fury.io/rb/vakit)
# Vakit
Vakit is a small tool which fetches prayer times for Turkey from www.samanyoluhaber.com and persists data in a Rails way. I plan to extend its capabilities to serve global prayer times for all nations.

## Installation
```ruby
gem 'vakit'
```
and just do a `bundle install` as usual.

## Usage
Using 'Vakit' is extremely easy. You're ready to go by just calling right keyword of returning hash:

- For Fajr
```console
$ Vakit.imsak
```

- For Shorook
```console
$ Vakit.sabah
```

- For Zuhr
```console
$ Vakit.oglen
```

- For Asr
```console
$ Vakit.ikindi
```

- For Maghrib
```console
$ Vakit.aksam
```

- For Isha
```console
$ Vakit.yatsi
```

## Contribution

Any kind of contribution is welcomed.

## Collabrators

= Murat
= Zeynep

## Testing
We're using RSPEC.

## License
GPL
Completly free :)
