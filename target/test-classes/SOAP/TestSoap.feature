@soapRequest
Feature: plan de pruebas orientado a las consultas del tipo soap

  Scenario Outline: caso de prueba tipo <casoPrueba>
    Given url 'https://www.dataaccess.com/webservicesserver/NumberConversion.wso'
    When header Content-Type = 'text/xml'
    And request
"""
<?xml version="1.0" encoding="utf-8"?>
<soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
  <soap:Body>
    <NumberToWords xmlns="http://www.dataaccess.com/webservicesserver/">
      <ubiNum><num></ubiNum>
    </NumberToWords>
  </soap:Body>
</soap:Envelope>
"""
    And method POST
    And match response/Envelope/Body/NumberToWordsResponse/NumberToWordsResult == '<asercion> '
    Examples:
      | casoPrueba         | num | asercion         |
      | caso de prueba 800 | 800 | eight hundred  |
      | numero 11          | 11  | eleven         |
      | numero 200         | 200 | two hundred    |
