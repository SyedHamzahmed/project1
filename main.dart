import 'dart:io';

class Book {
  String title;
  String author;
  bool isAvailable;

  Book(this.title, this.author, this.isAvailable);
}

class Library {
  List<Book> books = [];

  void addBook(String title, String author) {
    Book book = Book(title, author, true);
    books.add(book);
    print('Book added to the library!');
  }

  void removeBook(String title) {
    books.removeWhere((book) => book.title == title);
    print('Book removed from the library!');
  }

  void displayBooks() {
    print('Books in the library:');
    books.forEach((book) {
      print('Title: ${book.title}');
      print('Author: ${book.author}');
      print(
          'Availability: ${book.isAvailable ? "Available" : "Not Available"}');
      print('---');
    });
  }
}

void main() {
  Library library = Library();

  while (true) {
    print('1. Add book');
    print('2. Remove book');
    print('3. Display books');
    print('4. Exit');
    print('Enter your choice: ');

    String choice = stdin.readLineSync()!;

    switch (choice) {
      case '1':
        print('Enter book title: ');
        String title = stdin.readLineSync()!;
        print('Enter book author: ');
        String author = stdin.readLineSync()!;
        library.addBook(title, author);
        break;
      case '2':
        print('Enter book title: ');
        String title = stdin.readLineSync()!;
        library.removeBook(title);
        break;
      case '3':
        library.displayBooks();
        break;
      case '4':
        print('Exiting...');
        return;
      default:
        print('Invalid choice. Please try again.');
        break;
    }
  }
}
