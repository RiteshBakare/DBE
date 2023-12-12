import java.sql.*;

public class Demo {

    public static void main(String[] args) {

        String sql = "select * from users";

        String userName = "postgres";
        String password = "";
        String url = "jdbc:postgresql://localhost:5432/Demo";

        try {

            Connection connection = DriverManager.getConnection(url,userName,password);

            Statement statement = connection.createStatement();

            ResultSet resultSet = statement.executeQuery(sql);



            while (resultSet.next()) {
                int userId = resultSet.getInt("u_id");
                String userNameResult = resultSet.getString("u_name");
                String userEmail = resultSet.getString("u_mail");

                System.out.println("User ID: " + userId);
                System.out.println("User Name: " + userNameResult);
                System.out.println("User Email: " + userEmail);
                System.out.println("--------------------");
            }

            connection.close();

        } catch (SQLException e) {
            System.out.println("error: "+e.getMessage());
            throw new RuntimeException(e);
        }


    }

}
