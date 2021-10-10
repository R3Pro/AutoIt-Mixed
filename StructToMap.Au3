#cs
		Note: Maps are only available in the beta version
		
		Link Autoit beta : https://www.autoitscript.com/forum/files/file/515-autoit-v33154-beta/
#ce


$_expTag = "USHORT major;" & _
									"USHORT    minor;" &  _
									"USHORT micro;" &  _
									"USHORT  nano;" &  _
									"ptr   rc   [25];" &  _ ; Just an unusual example
                  "Char   Type[8];" &  _
                  "int[4];" &  _
									"ptr describe"
$_exp =  DllStructCreate($_expTag)


DllStructSetData($_exp,'major','1')
DllStructSetData($_exp,'minor','5')
DllStructSetData($_exp,'micro','13')
DllStructSetData($_exp,'nano','1245')
DllStructSetData($_exp,'Type','Test')
DllStructSetData($_exp,7,'1995')

$sMap = StructToMap($_exp,$_expTag)

MsgBox(0,VarGetType($sMap),$sMap.major & @CRLF &$sMap.minor & @CRLF & $sMap.micro & @CRLF & $sMap.nano & @CRLF & $sMap.rc & @CRLF & $sMap.Type & @CRLF & $sMap.Element7 & @CRLF & $sMap.describe)


Func StructToMap($Struct,$Tag_Struct)
	Local $mStruct[]
	$Tag_Struct = StringStripWS($Tag_Struct,4)
	$sTag = StringSplit($Tag_Struct,';')
	$i = 0
	Do
		$i += 1
		$Var = StringSplit(StringSplit($sTag[$i],'[')[1],' ')
		$mStruct[($Var[0] > 2 ? $Var[2] : ($Var[0] = 1 ? 'Element'&$i : $Var[$Var[0]]))] = DllStructGetData($Struct,$i)
	Until $sTag[0] = $i
	Return $mStruct
EndFunc
