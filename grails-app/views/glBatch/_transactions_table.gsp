  <div class="col-sm-12">
      <table class="table table-striped table-bordered text-center" v-show="transactions.length">
        <thead>
          <tr>
            <th>line</th>
            <th>Debit Account</th>
            <th>Credit Account</th>
            <th>Debit Amount</th>
            <th>Credit Amount</th>
            <th>Particulars</th>
            <th></th>
          </tr>
        </thead>
        <tbody>
          <tr v-repeat="transaction: transactions" v-on = "click: editTransaction(transaction)">
            <td>{{ transaction.lineNo }}</td>
            <td>{{ transaction.debitAccount }} {{transaction.glDebitName}}</td>
            <td>{{ transaction.creditAccount }} {{transaction.glCreditName}}</td>
            <td>{{ transaction.debit.toLocaleString('en') }}</td>
            <td>{{ transaction.credit.toLocaleString('en') }}</td>
            <td>{{ transaction.transactionParticulars }}</td>
            <td>  <button class="btn btn-danger btn-xs" v-on = "click: removeTransaction(transaction) "> Remove <i class="fa fa-trash-o"></i> </button> </td>
          </tr>
        </tbody>
      </table>

      <table border="0" v-show="transactions.length">
        <tr>
          <td width="200">Total Debit</td>
          <td><strong> {{ totalDebit.toLocaleString('en')  }}</strong></td>
        </tr>
        <tr>
          <td>Total Credit</td>
          <td><strong>{{ totalCredit.toLocaleString('en')  }}</strong></td>
        </tr>
        <tr>
          <td>Difference</td>
          <td><strong> {{ (totalDebit - totalCredit).toLocaleString('en')  }}</strong></td>
        </tr>
      </table>
    </div>
