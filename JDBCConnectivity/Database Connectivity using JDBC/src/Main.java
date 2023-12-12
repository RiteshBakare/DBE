import java.sql.*;

public class Main {

    public static void main(String[] args) {

        String sql = "select * from myDemo where my_id = 1";

        String url = "jdbc:postgresql://localhost:5432/Demo";
        String userName = "postgres";
        String password = "Ritesh@2003";

        try {
            Connection connection = DriverManager.getConnection(url,userName,password);

            Statement statement = connection.createStatement();

            ResultSet resultSet = statement.executeQuery(sql);

            resultSet.next();

            String ans = resultSet.getString(1);
            String lastName = resultSet.getString(2);

            System.out.println(ans);
            System.out.println(lastName);

            connection.close();

        } catch (SQLException e) {
            System.out.println("DB Not Connected");
            throw new RuntimeException(e);
        }

    }
}