$Header = @"
<style>
table.centered{
	margin-left: auto;
	margin-right: auto;
	width: 1200px;
}

th,td {
	padding: 7px 10px 10px 10px;
}

th {
	text-transform: uppercase;
	letter-spacing: 0.1em;
	font-size: 90%;
	border-bottom: 2px solid #111111;
	border-top: 1px solid #999;
	text-align: left;
}

tr.even {
	bacground-color: #efefef;
}

tr:hover {
	background-color: #c3e6e5;
}
/* Up and Down Arrows */
.sortable th.descend:after{
	content: "\25B2";
	}
.sortable th.ascend:after{
	content: "\25BC";
	}
</style>
<title>PS EventLog</title>
"@
get-eventlog -LogName "System" | 
Sort -Descending | 
Select -Property EventID,MachineName,Category,EntryType,Message,TimeGenerated -First 10 |
ConvertTo-Html -Head $Header > ".\pslog.htm"
