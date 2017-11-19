using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace passingValues
{
    public class EmployeeDataAcessLayer
    {
        public static List<Employee> GetEmployeesByDepartmet(int departmentId)
        {
            List<Employee> listAuthors = new List<Employee>();
            string cs = ConfigurationManager.ConnectionStrings["BookShopSystemConnectionString"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("spGetEmployeesByDepartmentId", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                //okazvame mu che idto det podavame na tozi metod e var-a @depId ot sql procedurata
                SqlParameter parameter = new SqlParameter("@DepartmentId", departmentId);
                cmd.Parameters.Add(parameter);
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    Employee emp = new Employee();
                    emp.Id = Convert.ToInt32(rdr["Id"]);
                    emp.EmployeeName = rdr["Name"].ToString();
                    //minavame prez joina na tablicite i zimame direktno imeto
                    emp.DepartmentName = (rdr["Name"].ToString());

                    listAuthors.Add(emp);
                }

            }

            return listAuthors;
        }
    }

    public class Employee
    {
        public int Id { get; set; }

        public string EmployeeName { get; set; }

        public string DepartmentName { get; set; }
    }
}