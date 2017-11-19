using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace passingValues
{
    public class AuthorsDataAccessLayer
    {
        //this is our object datasource who will pass the db data to be displayed in the controler(ex datagrid)
        public static List<Author> GetAllAuthors()
        {
            List<Author> listAuthors = new List<Author>();
            string cs = ConfigurationManager.ConnectionStrings["BookShopSystemConnectionString"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("Select * from Authors", con);
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    Author author = new Author();
                    author.Id = Convert.ToInt32(rdr["Id"]);
                    author.FirstName = rdr["FirstName"].ToString();
                    author.LastName = rdr["LastName"].ToString();

                    listAuthors.Add(author);
                }

            }

            return listAuthors;
        }

        public static List<Book> GetAllBooks()
        {
            List<Book> books = new List<Book>();
            string cs = ConfigurationManager.ConnectionStrings["BookShopSystemConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
              
                SqlCommand cmd = new SqlCommand("Select * from Books", con);
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    Book book = new Book();
                    book.Id = Convert.ToInt32(rdr["Id"]);
                    book.Title = rdr["Title"].ToString();
                    book.ReleaseDate = Convert.ToDateTime(rdr["ReleaseDate"]);
                    book.Price = Convert.ToDecimal(rdr["Price"]);
                    book.Copies = Convert.ToInt32(rdr["Copies"]);
                    book.AuthorId = Convert.ToInt32(rdr["Author_Id"]);

                    books.Add(book);
                }
               
            }

            return books;
        }


    }

    public class Author
    {
        public int Id { get; set; }

        public string FirstName { get; set; }

        public string LastName { get; set; }
    }

    public class Book
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public decimal Price { get; set; }
        public int Copies { get; set; }
        public DateTime ReleaseDate { get; set; }
        public int AuthorId { get; set; }
    }
}