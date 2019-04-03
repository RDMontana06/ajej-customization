<table class="table table-bordered table-striped">
        <legend class="section-header">General Ledger Classification</legend>
        
            <tr>
                    <td style="font-weight:bold" width="30%">General Ledger Code</td>
                    <td width="70%"><span><g:link controller="cfgAcctGlTemplate" action="show" id="${loanInstance?.glLink?.id}">${loanInstance?.glLink?.description}</g:link></span></td>
                </tr>
            
            <tr>
                    <td style="font-weight:bold" width="30%"> General Ledger Status </td>
                    <td width="70%"><span>${loanInstance?.loanPerformanceId?.description}</span></td>
                </tr>
</table>

<table class="table table-bordered table-striped">
        <legend class="section-header">Loan Performance Classification</legend>
        
            <tr>
                    <td style="font-weight:bold" width="30%">Name of Institution</td>
                    <td width="70%"><span>${loanInstance?.loanType?.description}</span></td>
                </tr>
                
            <tr>
                    <td style="font-weight:bold" width="30%">Economic Activity/Industry</td>
                    <td width="70%"><span>${loanInstance?.loanProject?.description}</span></td>
                </tr>
                
            <tr>
                    <td style="font-weight:bold" width="30%">Loan Security</td>
                    <td width="70%"><span>${loanInstance?.loanSecurity?.description}</span></td>
                </tr>
                 
            <!--    
            <tr>
                    <td style="font-weight:bold" width="30%">Purpose Agri\Agra</td>
                    <td width="70%"><span>${loanInstance?.loanProjectAgriagra?.description}</span></td>
                </tr>
            -->
            
            <!--
            <tr>
                    <td style="font-weight:bold" width="30%">Purpose Loan Granted</td>
                    <td width="70%"><span>${loanInstance?.loanProjectSummaryGranted?.description}</span></td>
                </tr>
            -->
                
            <tr>
                    <td style="font-weight:bold" width="30%">Loan Credit Rating</td>
                    <td width="70%"><span>${loanInstance?.loanCreditRating?.description}</span></td>
                </tr>
                
            <tr>
                    <td style="font-weight:bold" width="30%">Kind of Loan</td>
                    <td width="70%"><span>${loanInstance?.loanKindOfLoan?.description}</span></td>
                </tr>
                
            <tr>
                    <td style="font-weight:bold" width="30%">Loan Provision Classification</td>
                    <td width="70%"><span>${loanInstance?.loanProvision?.description}</span></td>
                </tr>
        

</table>




<br/><br/>
