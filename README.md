![](https://img.shields.io/badge/Microverse-blueviolet)

# OOP School Library

> This project contain classes for a school library.

## Built With

- Ruby

## Getting Started

You will need to have Ruby installed.

Clone this repo and enter the directory.

```shell
git clone https://github.com/piero-vic/oop-school-library.git
cd oop-school-library
```

Run the Interactive Ruby Shell.

```shell
irb
```

Try the classes.

```ruby
require "./person.rb"
# => true
person = Person.new(19)
# => #<Person:0x000000010e135268 @age=19, @id=265, @name="Tim", @parent_permission=true>
person.name
# => "Unknow"
person.can_use_services?
# => true
```

## Author

👤 **Piero Lescano**

- GitHub: [GitHub](https://github.com/piero-vic).
- Twitter: [Twitter](https://twitter.com/v1ccenzo).
- LinkedIn: [Linkedin](https://www.linkedin.com/in/piero-lescano).

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

## Show your support

Give a ⭐️ if you like this project!

