Imports System
Imports System.Collections.Generic
Imports System.Text
Imports System.Runtime.InteropServices
Imports System.Data
Imports System.Collections

Namespace SQLiteWrapper
    Public Class SQLiteBase
        <DllImport("kernel32")> _
        Private Shared Function HeapAlloc(ByVal heap As IntPtr, ByVal flags As UInt32, ByVal bytes As UInt32) As IntPtr
        End Function

        <DllImport("kernel32")> _
        Private Shared Function GetProcessHeap() As IntPtr
        End Function

        <DllImport("kernel32")> _
        Private Shared Function lstrlen(ByVal str As IntPtr) As Integer
        End Function
        <DllImport("sqlite3")> _
        Private Shared Function sqlite3_open(ByVal fileName As IntPtr, ByRef database As IntPtr) As Integer
        End Function

        <DllImport("sqlite3")> _
        Private Shared Function sqlite3_close(ByVal database As IntPtr) As Integer
        End Function

        <DllImport("sqlite3")> _
        Private Shared Function sqlite3_exec(ByVal database As IntPtr, ByVal query As IntPtr, ByVal callback As IntPtr, ByVal arguments As IntPtr, ByRef [error] As IntPtr) As Integer
        End Function

        <DllImport("sqlite3")> _
        Private Shared Function sqlite3_errmsg(ByVal database As IntPtr) As IntPtr
        End Function

        <DllImport("sqlite3")> _
        Private Shared Function sqlite3_prepare_v2(ByVal database As IntPtr, ByVal query As IntPtr, ByVal length As Integer, ByRef statement As IntPtr, ByRef tail As IntPtr) As Integer
        End Function

        <DllImport("sqlite3")> _
        Private Shared Function sqlite3_step(ByVal statement As IntPtr) As Integer
        End Function

        <DllImport("sqlite3")> _
        Private Shared Function sqlite3_column_count(ByVal statement As IntPtr) As Integer
        End Function

        <DllImport("sqlite3")> _
        Private Shared Function sqlite3_column_name(ByVal statement As IntPtr, ByVal columnNumber As Integer) As IntPtr
        End Function

        <DllImport("sqlite3")> _
        Private Shared Function sqlite3_column_type(ByVal statement As IntPtr, ByVal columnNumber As Integer) As Integer
        End Function

        <DllImport("sqlite3")> _
        Private Shared Function sqlite3_column_int(ByVal statement As IntPtr, ByVal columnNumber As Integer) As Integer
        End Function

        <DllImport("sqlite3")> _
        Private Shared Function sqlite3_column_double(ByVal statement As IntPtr, ByVal columnNumber As Integer) As Double
        End Function

        <DllImport("sqlite3")> _
        Private Shared Function sqlite3_column_text(ByVal statement As IntPtr, ByVal columnNumber As Integer) As IntPtr
        End Function

        <DllImport("sqlite3")> _
        Private Shared Function sqlite3_column_blob(ByVal statement As IntPtr, ByVal columnNumber As Integer) As IntPtr
        End Function

        <DllImport("sqlite3")> _
        Private Shared Function sqlite3_column_table_name(ByVal statement As IntPtr, ByVal columnNumber As Integer) As IntPtr
        End Function

        <DllImport("sqlite3")> _
        Private Shared Function sqlite3_finalize(ByVal handle As IntPtr) As Integer
        End Function

        ' SQLite constants
        Private Const SQL_OK As Integer = 0
        Private Const SQL_ROW As Integer = 100
        Private Const SQL_DONE As Integer = 101
        Public Enum SQLiteDataTypes
            INT = 1
            FLOAT
            TEXT
            BLOB
            NULL
        End Enum
        Private database As IntPtr
        Public Sub New()
            database = IntPtr.Zero
        End Sub
        Public Sub New(ByVal baseName As [String])
            OpenDatabase(baseName)
        End Sub
        Public Sub OpenDatabase(ByVal baseName As [String])
            If sqlite3_open(StringToPointer(baseName), database) <> SQL_OK Then
                database = IntPtr.Zero
                Throw New Exception("Error with opening database " & baseName & "!")
            End If
        End Sub
        Public Sub CloseDatabase()
            If database <> IntPtr.Zero Then
                sqlite3_close(database)
            End If
        End Sub
        Public Function GetTables() As ArrayList
            Dim query As [String] = "SELECT name FROM sqlite_master " & "WHERE type IN ('table','view') AND name NOT LIKE 'sqlite_%'" & "UNION ALL " & "SELECT name FROM sqlite_temp_master " & "WHERE type IN ('table','view') " & "ORDER BY 1"
            Dim table As DataTable = ExecuteQuery(query)
            Dim list As New ArrayList()
            For Each row As DataRow In table.Rows
                list.Add(row.ItemArray(0).ToString())
            Next
            Return list
        End Function
        Public Sub ExecuteNonQuery(ByVal query As [String])
            Dim [error] As IntPtr
            sqlite3_exec(database, StringToPointer(query), IntPtr.Zero, IntPtr.Zero, [error])
            If [error] <> IntPtr.Zero Then
                Throw New Exception(("Error with executing non-query: """ & query & """!" & vbLf) + PointerToString(sqlite3_errmsg([error])))
            End If
        End Sub
        Public Function ExecuteQuery(ByVal query As [String]) As DataTable
            Dim statement As IntPtr
            Dim excessData As IntPtr
            sqlite3_prepare_v2(database, StringToPointer(query), GetPointerLenght(StringToPointer(query)), statement, excessData)
            Dim table As New DataTable()
            Dim result As Integer = ReadFirstRow(statement, table)
            While result = SQL_ROW
                result = ReadNextRow(statement, table)
            End While
            sqlite3_finalize(statement)
            Return table
        End Function
        Private Function ReadFirstRow(ByVal statement As IntPtr, ByRef table As DataTable) As Integer
            table = New DataTable("resultTable")
            Dim resultType As Integer = sqlite3_step(statement)
            If resultType = SQL_ROW Then
                Dim columnCount As Integer = sqlite3_column_count(statement)
                Dim columnName As [String] = ""
                Dim columnType As Integer = 0
                Dim columnValues As Object() = New Object(columnCount - 1) {}
                For i As Integer = 0 To columnCount - 1
                    columnName = PointerToString(sqlite3_column_name(statement, i))
                    columnType = sqlite3_column_type(statement, i)
                    Select Case columnType
                        Case CInt(SQLiteDataTypes.INT)
                            If True Then
                                table.Columns.Add(columnName, Type.[GetType]("System.Int32"))
                                columnValues(i) = sqlite3_column_int(statement, i)
                                Exit Select
                            End If
                        Case CInt(SQLiteDataTypes.FLOAT)
                            If True Then
                                table.Columns.Add(columnName, Type.[GetType]("System.Single"))
                                columnValues(i) = sqlite3_column_double(statement, i)
                                Exit Select
                            End If
                        Case CInt(SQLiteDataTypes.TEXT)
                            If True Then
                                table.Columns.Add(columnName, Type.[GetType]("System.String"))
                                columnValues(i) = PointerToString(sqlite3_column_text(statement, i))
                                Exit Select
                            End If
                        Case CInt(SQLiteDataTypes.BLOB)
                            If True Then
                                table.Columns.Add(columnName, Type.[GetType]("System.String"))
                                columnValues(i) = PointerToString(sqlite3_column_blob(statement, i))
                                Exit Select
                            End If
                        Case Else
                            If True Then
                                table.Columns.Add(columnName, Type.[GetType]("System.String"))
                                columnValues(i) = ""
                                Exit Select
                            End If
                    End Select
                Next
                table.Rows.Add(columnValues)
            End If
            Return sqlite3_step(statement)
        End Function
        Private Function ReadNextRow(ByVal statement As IntPtr, ByRef table As DataTable) As Integer
            Dim columnCount As Integer = sqlite3_column_count(statement)

            Dim columnType As Integer = 0
            Dim columnValues As Object() = New Object(columnCount - 1) {}

            For i As Integer = 0 To columnCount - 1
                columnType = sqlite3_column_type(statement, i)

                Select Case columnType
                    Case CInt(SQLiteDataTypes.INT)
                        If True Then
                            columnValues(i) = sqlite3_column_int(statement, i)
                            Exit Select
                        End If
                    Case CInt(SQLiteDataTypes.FLOAT)
                        If True Then
                            columnValues(i) = sqlite3_column_double(statement, i)
                            Exit Select
                        End If
                    Case CInt(SQLiteDataTypes.TEXT)
                        If True Then
                            columnValues(i) = PointerToString(sqlite3_column_text(statement, i))
                            Exit Select
                        End If
                    Case CInt(SQLiteDataTypes.BLOB)
                        If True Then
                            columnValues(i) = PointerToString(sqlite3_column_blob(statement, i))
                            Exit Select
                        End If
                    Case Else
                        If True Then
                            columnValues(i) = ""
                            Exit Select
                        End If
                End Select
            Next
            table.Rows.Add(columnValues)
            Return sqlite3_step(statement)
        End Function
        Private Function StringToPointer(ByVal str As [String]) As IntPtr
            If str Is Nothing Then
                Return IntPtr.Zero
            Else
                Dim encoding__1 As Encoding = Encoding.UTF8
                Dim bytes As [Byte]() = encoding__1.GetBytes(str)
                Dim length As UInteger = bytes.Length + 1
                Dim pointer As IntPtr = HeapAlloc(GetProcessHeap(), 0, DirectCast(length, UInt32))
                Marshal.Copy(bytes, 0, pointer, bytes.Length)
                Marshal.WriteByte(pointer, bytes.Length, 0)
                Return pointer
            End If
        End Function
        Private Function PointerToString(ByVal ptr As IntPtr) As [String]
            If ptr = IntPtr.Zero Then
                Return Nothing
            End If

            Dim encoding__1 As Encoding = Encoding.UTF8

            Dim length As Integer = GetPointerLenght(ptr)
            Dim bytes As [Byte]() = New [Byte](length - 1) {}
            Marshal.Copy(ptr, bytes, 0, length)
            Return encoding__1.GetString(bytes, 0, length)
        End Function
        Private Function GetPointerLenght(ByVal ptr As IntPtr) As Integer
            If ptr = IntPtr.Zero Then
                Return 0
            End If
            Return lstrlen(ptr)
        End Function
    End Class
End Namespace
