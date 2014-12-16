Imports System
Imports System.Collections.Generic
Imports System.Net
Imports System.IO
Imports System.Text


Public Class Form1


    ' Setup the variables necessary to make the Request
    Dim grantType As String = "password"
    Dim applicationid As String = "{applicationId}"
    Dim clientid As String = "311_4y6ok3vk6bokswwc4ow0gkgsc4wwcs8goksskgokskgkoocwc0"
    Dim clientsecret As String = "2rgmb4110qas0osogcwwowgck4wso0g8g0kokksgo4cwwksk4o"
    Dim username As String = "tmcdevitt@atlasdev.com"
    Dim password As String = "sunshine"
    Dim url As String = "https://api.trackvia.com/oauth/v2/token?"
    Dim response As HttpWebResponse = Nothing


    Private Sub btnPost_Click(sender As Object, e As EventArgs) Handles btnPost.Click

        'https://api.trackvia.com/oauth/v2/token?
        'client_id={CLIENT_ID}&
        'client_secret={CLIENT_SECRET}&
        'grant_type = password&
        'username={USERNAME}&
        'password = {password}


        

        ' Create the data to send
        Dim data As StringBuilder = New StringBuilder()
        data.Append("client_id=" + Uri.EscapeDataString(clientid))
        data.Append("&client_secret=" + Uri.EscapeDataString(clientsecret))
        data.Append("&grant_type=" + Uri.EscapeDataString(grantType))
        data.Append("&username=" + Uri.EscapeDataString(username))
        data.Append("&password=" + Uri.EscapeDataString(password))

        ' Create a byte array of the data to be sent
        Dim byteArray As Byte() = UTF8Encoding.UTF8.GetBytes(data.ToString())

        ' Setup the Request
        Dim request As HttpWebRequest = WebRequest.Create(url)
        request.Method = "POST"
        request.ContentType = "application/x-www-form-urlencoded"
        request.ContentLength = byteArray.Length

        ' Write data
        Dim postStream As Stream = request.GetRequestStream()
        postStream.Write(byteArray, 0, byteArray.Length)
        postStream.Close()

        ' Send Request & Get Response
        response = request.GetResponse()

        ' Get the Response Stream
        Dim reader As StreamReader = New StreamReader(response.GetResponseStream())
        Dim json As String = reader.ReadLine()
        Console.WriteLine(json)

        ' Retrieve the Access Token
        'Dim ser As JavaScriptSerializer = New JavaScriptSerializer()
        'Dim x As Dictionary(Of String, Object) = ser.DeserializeObject(json)
        'Dim accessToken As String = x("access_token").ToString()

    End Sub




End Class
