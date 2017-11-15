<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<!DOCTYPE html>
<html>

<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>新增表單樣板</title>

	<link rel="stylesheet" href="css/form-basic.css">

</head>

    <div class="main-content">

        <!-- You only need this form and the form-basic.css -->
		<div class="form-basic">
        <s:form class="form-basic" >

            <div class="form-title-row">
                <h1>Form Example</h1>
            </div>

            <div class="form-row">
                <label>
                    <span>Full name</span>
                    <input type="text" name="name">
                </label>
            </div>

            <div class="form-row">
                <label>
                    <span>Email</span>
                    <input type="email" name="email">
                </label>
            </div>

            <div class="form-row">
                <label>
                    <span>Dropdown</span>
                    <select name="dropdown">
                        <option>Option One</option>
                        <option>Option Two</option>
                        <option>Option Three</option>
                        <option>Option Four</option>
                    </select>
                </label>
            </div>

            <div class="form-row">
                <label>
                    <span>Textarea</span>
                    <textarea name="textarea"></textarea>
                </label>
            </div>

            <div class="form-row">
                <label>
                    <span>Checkbox</span>
                    <input type="checkbox" name="checkbox" checked>
                </label>
            </div>

            <div class="form-row">
                <label><span>Radio</span></label>
                <div class="form-radio-buttons">

                    <div>
                        <label>
                            <input type="radio" name="radio">
                            <span>Radio option 1</span>
                        </label>
                    </div>

                    <div>
                        <label>
                            <input type="radio" name="radio">
                            <span>Radio option 2</span>
                        </label>
                    </div>

                    <div>
                        <label>
                            <input type="radio" name="radio">
                            <span>Radio option 3</span>
                        </label>
                    </div>

                </div>
            </div>

            <div class="form-row">
                <button type="submit">Submit Form</button>
            </div>

        </s:form>
        </div>

    </div>

</body>

</html>
