<!DOCTYPE html>
<html>
<head>
    <title>Simple Calculator</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <div class="container">
        <h2>Simple Calculator</h2>
        <form method="post">
            <input type="text" name="num1" placeholder="Enter first number" required>
            <select name="operation">
                <option value="add">Add</option>
                <option value="subtract">Subtract</option>
                <option value="multiply">Multiply</option>
                <option value="divide">Divide</option>
            </select>
            <input type="text" name="num2" placeholder="Enter second number" required>
            <input type="submit" value="Calculate">
        </form>

        <div class="result">
            <% 
                String num1 = request.getParameter("num1");
                String num2 = request.getParameter("num2");
                String operation = request.getParameter("operation");

                if (num1 != null && num2 != null && operation != null) {
                    try {
                        double number1 = Double.parseDouble(num1);
                        double number2 = Double.parseDouble(num2);
                        double result = 0;
                        boolean valid = true;

                        switch (operation) {
                            case "add":
                                result = number1 + number2;
                                break;
                            case "subtract":
                                result = number1 - number2;
                                break;
                            case "multiply":
                                result = number1 * number2;
                                break;
                            case "divide":
                                if (number2 != 0) {
                                    result = number1 / number2;
                                } else {
                                    %><p class="error">Error: Cannot divide by zero</p><%
                                    valid = false;
                                }
                                break;
                        }

                        if (valid) {
                            %><p class="success">Result: <%= result %></p><%
                        }
                    } catch (NumberFormatException e) {
                        %><p class="error">Invalid number format</p><%
                    }
                }
            %>
        </div>
    </div>
</body>
</html>
