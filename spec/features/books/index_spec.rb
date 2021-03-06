require 'rails_helper'

RSpec.describe "Book index page" do
  before :each do
    @book_1 = Book.create!(title: "Book 1 title", pages: 300, year: 1992, cover_image: "https://iguhb7lay20b9vtl-zippykid.netdna-ssl.com/wp-content/uploads/2018/04/1_wswf9QNmKrwTB883hHb4BQ.png")
    @book_2 = Book.create!(title: "Book 2 title", pages: 350, year: 1986, cover_image: "https://images.penguinrandomhouse.com/cover/9781101931288")
    @book_3 = Book.create!(title: "Book 3 title", pages: 125, year: 1942, cover_image: "https://s26162.pcdn.co/wp-content/uploads/2018/08/81Ya99Bc-jL.jpg")
    @book_4 = Book.create!(title: "Book 4 title", pages: 226, year: 1942, cover_image: "https://s26162.pcdn.co/wp-content/uploads/2018/08/81Ya99Bc-jL.jpg")
    @book_5 = Book.create!(title: "Book 5 title", pages: 135, year: 1942, cover_image: "https://s26162.pcdn.co/wp-content/uploads/2018/08/81Ya99Bc-jL.jpg")
    @book_6 = Book.create!(title: "Book 6 title", pages: 555, year: 1942, cover_image: "https://s26162.pcdn.co/wp-content/uploads/2018/08/81Ya99Bc-jL.jpg")

    @author_1 = @book_1.authors.create!(name: "Michael")
    @author_2 = @book_1.authors.create!(name: "John")
    @author_3 = @book_2.authors.create!(name: "Bill")
    @author_4 = @book_3.authors.create!(name: "Loren")
    @author_5 = @book_4.authors.create!(name: "Jenna")
    @author_6 = @book_5.authors.create!(name: "Mark")
    @author_7 = @book_6.authors.create!(name: "Karen")

    @user_1 = User.create!(name: "John")
    @user_2 = User.create!(name: "Bill")
    @user_3 = User.create!(name: "Larry")
    @user_4 = User.create!(name: "Stella")
    @user_5 = User.create!(name: "Sarah")
    @user_6 = User.create!(name: "Kristin")

    @review_1 = Review.create!(title: "review 7", rating: 5, description: "Book 1 review", user: @user_1, book: @book_4)

    @review_2 = Review.create!(title: "review 4", rating: 5, description: "Book 1 review", user: @user_1, book: @book_2)
    @review_3 = Review.create!(title: "review 5", rating: 4, description: "Book 1 review", user: @user_2, book: @book_2)

    @review_4 = Review.create!(title: "review 7", rating: 3, description: "Book 1 review", user: @user_1, book: @book_3)
    @review_5 = Review.create!(title: "review 8", rating: 3, description: "Book 1 review", user: @user_2, book: @book_3)
    @review_6 = Review.create!(title: "review 9", rating: 3, description: "Book 1 review", user: @user_3, book: @book_3)

    @review_7 = Review.create!(title: "review 7", rating: 4, description: "Book 1 review", user: @user_1, book: @book_5)
    @review_8 = Review.create!(title: "review 8", rating: 3, description: "Book 1 review", user: @user_2, book: @book_5)
    @review_9 = Review.create!(title: "review 9", rating: 4, description: "Book 1 review", user: @user_3, book: @book_5)
    @review_10 = Review.create!(title: "review 9", rating: 4, description: "Book 1 review", user: @user_4, book: @book_5)

    @review_11 = Review.create!(title: "review 7", rating: 3, description: "Book 1 review", user: @user_1, book: @book_6)
    @review_12 = Review.create!(title: "review 8", rating: 5, description: "Book 1 review", user: @user_2, book: @book_6)
    @review_13 = Review.create!(title: "review 9", rating: 5, description: "Book 1 review", user: @user_3, book: @book_6)
    @review_14 = Review.create!(title: "review 9", rating: 5, description: "Book 1 review", user: @user_4, book: @book_6)
    @review_15 = Review.create!(title: "review 9", rating: 5, description: "Book 1 review", user: @user_5, book: @book_6)

    @review_16 = Review.create!(title: "review 1", rating: 3, description: "Book 1 review", user: @user_1, book: @book_1)
    @review_17 = Review.create!(title: "review 2", rating: 3, description: "Book 1 review", user: @user_2, book: @book_1)
    @review_18 = Review.create!(title: "review 3", rating: 3, description: "Book 1 review", user: @user_3, book: @book_1)
    @review_19 = Review.create!(title: "review 10", rating: 1, description: "Book 1 review", user: @user_4, book: @book_1)
    @review_20 = Review.create!(title: "review 11", rating: 1, description: "Book 1 review", user: @user_5, book: @book_1)
    @review_21 = Review.create!(title: "review 12", rating: 1, description: "Book 1 review", user: @user_6, book: @book_1)
  end


  describe "As a visitor I see a navigation bar" do
    it "It includes a links to the home page and a link to browse all books" do

      visit books_path
      expect(page).to have_link('Home')
      expect(page).to have_link('Books')

    end
  end

  describe "When I visit /books" do
    it "Displays title, page number, year published, cover_image, and author/authors who wrote the book" do

      visit books_path

      within("#book-info-#{@book_1.id}") do
      expect(page).to have_link(@book_1.title)
      expect(page).to have_content(@book_1.pages)
      expect(page).to have_content(@book_1.year)
      expect(page).to have_xpath('//img[@src="https://iguhb7lay20b9vtl-zippykid.netdna-ssl.com/wp-content/uploads/2018/04/1_wswf9QNmKrwTB883hHb4BQ.png"]')
      expect(page).to have_link(@author_1.name)
      expect(page).to have_link(@author_2.name)
      end
      within("#book-info-#{@book_2.id}") do
      expect(page).to have_link(@book_2.title)
      expect(page).to have_content(@book_2.pages)
      expect(page).to have_content(@book_2.year)
      expect(page).to have_xpath('//img[@src="https://images.penguinrandomhouse.com/cover/9781101931288"]')
      expect(page).to have_link(@author_3.name)
      end
      within("#book-info-#{@book_3.id}") do
      expect(page).to have_link(@book_3.title)
      expect(page).to have_content(@book_3.pages)
      expect(page).to have_content(@book_3.year)
      expect(page).to have_xpath('//img[@src="https://s26162.pcdn.co/wp-content/uploads/2018/08/81Ya99Bc-jL.jpg"]')
      expect(page).to have_link(@author_4.name)
      end
    end
    it "Next to each book title, I see its average book rating, and total number of reviews" do

      visit books_path

      within("#book-info-#{@book_1.id}") do
        expect(page).to have_content("Average Rating: 2.0")
        expect(page).to have_content("Total Reviews: 6")
      end
      within("#book-info-#{@book_2.id}") do
        expect(page).to have_content("Average Rating: 4.5")
        expect(page).to have_content("Total Reviews: 2")
      end
      within("#book-info-#{@book_3.id}") do
        expect(page).to have_content("Average Rating: 3.0")
        expect(page).to have_content("Total Reviews: 3")
      end
    end
    it "All instances of a books title is a link to a show page" do

      visit books_path

      within("#book-info-#{@book_1.id}") do
        expect(page).to have_link(@book_1.title)
      end
      within("#book-info-#{@book_2.id}") do
        expect(page).to have_link(@book_2.title)
      end
      within("#book-info-#{@book_3.id}") do
        click_link @book_3.title
      end
      expect(current_path).to eq(book_path(@book_3))
  end

  it "Shows a link to sort books by rating" do
    visit books_path

    within("#sorting") do
      expect(page).to have_link("Highest Rated")
      expect(page).to have_link("Lowest Rated")
    end

    within("#sorting") do
      click_link "Highest Rated"
    end
    expect(current_path).to eq(books_path)

    within("#books") do
    expect(page.all('h5')[0]).to have_link(@book_4.title)
    expect(page.all('h5')[1]).to have_link(@book_6.title)
    expect(page.all('h5')[2]).to have_link(@book_2.title)
    expect(page.all('h5')[3]).to have_link(@book_5.title)
    expect(page.all('h5')[4]).to have_link(@book_3.title)
    expect(page.all('h5')[5]).to have_link(@book_1.title)
      end
    end
    it "Has link to sort lowest rated books first" do

      visit books_path

      within("#sorting") do
        click_link "Lowest Rated"
      end
      expect(current_path).to eq(books_path)

      within("#books") do
        expect(page.all('h5')[0]).to have_link(@book_1.title)
        expect(page.all('h5')[1]).to have_link(@book_3.title)
        expect(page.all('h5')[2]).to have_link(@book_5.title)
        expect(page.all('h5')[3]).to have_link(@book_2.title)
        expect(page.all('h5')[4]).to have_link(@book_6.title)
        expect(page.all('h5')[5]).to have_link(@book_4.title)
    end
  end
  it "page has a link to sort by highest page count" do

    visit books_path

    within("#sorting") do
      click_link "Highest Page Count"
    end
    expect(current_path).to eq(books_path)

    within("#books") do
      expect(page.all('h5')[0]).to have_link(@book_6.title)
      expect(page.all('h5')[1]).to have_link(@book_2.title)
      expect(page.all('h5')[2]).to have_link(@book_1.title)
      expect(page).to have_link(@author_1.name)
      expect(page).to have_link(@author_2.name)
      expect(page.all('h5')[3]).to have_link(@book_4.title)
      expect(page).to have_link(@author_5.name)
      expect(page.all('h5')[4]).to have_link(@book_5.title)
      expect(page).to have_link(@author_6.name)
      expect(page.all('h5')[5]).to have_link(@book_3.title)
      expect(page).to have_link(@author_4.name)

    end
    end
    it "Has a link to sort by lowest page count" do

      visit books_path

      within("#sorting") do
        click_link "Lowest Page Count"
      end
      expect(current_path).to eq(books_path)

      within("#books") do
        expect(page.all('h5')[0]).to have_link(@book_3.title)
        expect(page.all('h5')[1]).to have_link(@book_5.title)
        expect(page.all('h5')[2]).to have_link(@book_4.title)
        expect(page.all('h5')[3]).to have_link(@book_1.title)
        expect(page.all('h5')[4]).to have_link(@book_2.title)
        expect(page.all('h5')[5]).to have_link(@book_6.title)
    end
    end
    it "page is sorted by book with highest number of reviews" do

        visit books_path

        within("#sorting") do
          click_link "Most Reviewed"
        end
        expect(current_path).to eq(books_path)

        within("#books") do
          expect(page.all('h5')[0]).to have_link(@book_1.title)
          expect(page.all('h5')[1]).to have_link(@book_6.title)
          expect(page.all('h5')[2]).to have_link(@book_5.title)
          expect(page.all('h5')[3]).to have_link(@book_3.title)
          expect(page.all('h5')[4]).to have_link(@book_2.title)
          expect(page.all('h5')[5]).to have_link(@book_4.title)

        end
      end
      it "page is sorted by books with least number of reviews" do

        visit books_path

        within("#sorting") do
          click_link "Least Reviewed"
        end
        expect(current_path).to eq(books_path)

        within("#books") do
        expect(page.all('h5')[0]).to have_link(@book_4.title)
        expect(page.all('h5')[1]).to have_link(@book_2.title)
        expect(page.all('h5')[2]).to have_link(@book_3.title)
        expect(page.all('h5')[3]).to have_link(@book_5.title)
        expect(page.all('h5')[4]).to have_link(@book_6.title)
        expect(page.all('h5')[5]).to have_link(@book_1.title)
    end
  end
  describe "Statistics section" do
    it "shows three highest rated books" do

      visit books_path

        within("#highest-rated") do
          expect(page).to have_link(@book_4.title)
          expect(page.all('p')[0]).to have_content("Average Rating: 5.0")
          expect(page).to have_content(@book_6.title)
          expect(page.all('p')[1]).to have_content("Average Rating: 4.6")
          expect(page).to have_content(@book_2.title)
          expect(page.all('p')[2]).to have_content("Average Rating: 4.5")
        end
        within("#worst-rated") do
          expect(page).to have_link(@book_1.title)
          expect(page.all('p')[0]).to have_content("Average Rating: 2.0")
          expect(page).to have_content(@book_3.title)
          expect(page.all('p')[1]).to have_content("Average Rating: 3.0")
          expect(page).to have_content(@book_5.title)
          expect(page.all('p')[2]).to have_content("Average Rating: 3.8")
        end
        within("#most-reviews") do
          expect(page).to have_link(@user_1.name)
          expect(page.all('p')[0]).to have_content("Total Reviews: 6")
          expect(page).to have_link(@user_2.name)
          expect(page.all('p')[1]).to have_content("Total Reviews: 5")
          expect(page).to have_link(@user_3.name)
          expect(page.all('p')[2]).to have_content("Total Reviews: 4")
          end
        end
        it "Shows a link to create a new book, I am redirected to a form" do

        visit books_path

        click_link "Add a Book"

        expect(current_path).to eq(new_book_path)
      end
      it "books that are not reviewed are displayed at the bottom of the page" do
        book_7 = Book.create!(title: "Book 7 no review", pages: 223, year: 1987, cover_image: "www.google.com")
          author_1 = book_7.authors.create!(name: "Shrek")
        book_8 = Book.create!(title: "Book 8 no review", pages: 435, year: 1996, cover_image: "www.yahoo.com")
          author_2 = book_8.authors.create!(name: "Donkey")
        book_9 = Book.create!(title: "Book 9 no review", pages: 565, year: 1988, cover_image: "www.askjeeves.com")
          author_3 = book_9.authors.create!(name: "Fiona")

        visit books_path

        within("#sorting") do
          click_link "Highest Rated"
        end

        within("#not-reviewed-#{book_7.id}") do
          expect(page).to have_link(book_7.title)
          expect(page).to have_content(book_7.pages)
          expect(page).to have_content(book_7.year)
          expect(page).to have_xpath('//img[@src="www.google.com"]')
        end
        within("#not-reviewed-#{book_8.id}") do
          expect(page).to have_link(book_8.title)
          expect(page).to have_content(book_8.pages)
          expect(page).to have_content(book_8.year)
          expect(page).to have_xpath('//img[@src="www.yahoo.com"]')
        end
        within("#not-reviewed-#{book_9.id}") do
          expect(page).to have_link(book_9.title)
          expect(page).to have_content(book_9.pages)
          expect(page).to have_content(book_9.year)
          expect(page).to have_xpath('//img[@src="www.askjeeves.com"]')
          end
        end
      end
    end
  end
