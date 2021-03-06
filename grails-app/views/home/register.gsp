<!DOCTYPE html>
<html lang="en">

<head>
    <meta name="layout" content="main">
</head>

<body>

<div class="container-fluid">
    <section class="container">
        <div class="container-page">
            <g:form controller="home" action="saveUser">
            <div class="col-md-6">
                <h3 class="dark-grey">Registration</h3>


                <div class="form-group col-lg-12">
                    <label>Email Address</label>
                    <input type="" name="username" class="form-control" id="username" value="">
                </div>

                <div class="form-group col-lg-12">
                    <label>Password</label>
                    <input type="password" name="password" class="form-control" id="password" value="">
                </div>

                <div class="form-group col-lg-12">
                    <label>Repeat Password</label>
                    <input type="password" name="password2" class="form-control" id="password2" value="">
                </div>

                <div class="form-group col-lg-12">
                    <label>Name</label>
                    <input type="" name="displayName" class="form-control" id="displayName" value="">
                </div>

            </div>

            <div class="col-md-6">
                <h3 class="dark-grey">Terms and Conditions</h3>
                <p>
                    By clicking on "Register" you agree to The Company's' Terms and Conditions
                </p>
                <p>
                    While rare, prices are subject to change based on exchange rate fluctuations -
                    should such a fluctuation happen, we may request an additional payment. You have the option to request a full refund or to pay the new price. (Paragraph 13.5.8)
                </p>
                <p>
                    Should there be an error in the description or pricing of a product, we will provide you with a full refund (Paragraph 13.5.6)
                </p>
                <p>
                    Acceptance of an order by us is dependent on our suppliers ability to provide the product. (Paragraph 13.5.6)
                </p>

                <button type="submit" class="btn btn-primary">Register</button>
            </div>
                </g:form>
        </div>
    </section>
</div>


</body>

</html>
