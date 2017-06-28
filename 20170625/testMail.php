<?php
echo 123;
$Name = "limao"; //senders name
$email = "limao@smartisan.com"; //senders e-mail adress
$recipient = "limao@smartisan.com"; //recipient
$mail_body = "The text for the mail..."; //mail body
$subject = "Subject for reviever"; //subject
$header = "From: ". $Name . " <" . $email . ">\r\n"; //optional headerfields

$result = mail($recipient, $subject, $mail_body, $header); //mail command :)
var_dump($result);
