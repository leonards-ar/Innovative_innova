<div class="list">
  <g:hasErrors bean="${addCommand}">
    <div class="errors">
      <g:renderErrors bean="${addCommand}" as="list" />
    </div>
  </g:hasErrors>
  <table style="margin-top: 5px;">
    <thead>
      <tr>
        <th><g:message code="proformaDetail.product" default="Product" /></th>

        <th><g:message code="proformaDetail.quantity" default="Quantity" /></th>

        <th><g:message code="proformaDetail.dailyDose" default="Daily Dose" /></th>

        <th><g:message code="product.price" default="Price" /></th>

        <th><g:message code="proformaDetail.total" default="Total" /></th>

        <th>&nbsp;</th>
    </tr>

   </thead>
   <tbody>
      <tr class="odd">
      <td valign="top" class="value ${hasErrors(field: 'addProductId', 'errors')}">
        <g:select name="addProductId" from="${com.vitaflo.innova.Product.list()}" optionKey="id"
                  value="${addCommand?.addProductId}"
                  noSelection="['':'Seleccione...']"
                  onchange="${remoteFunction(controller:'proforma', action:'updatePrice',update:'addPrice', params:'\'addProductId=\'  + this.value')}"
                  />
      </td>

      <td valign="top" class="value ${hasErrors(field: 'addQuantity', 'errors')}">
        <g:textField name="addQuantity" value="${fieldValue(bean: addCommand, field: 'addQuantity')}"/>
      </td>

      <td valign="top" class="value ${hasErrors(field: 'addDailyDose', 'errors')}">
        <g:textField name="addDailyDose" value="${fieldValue(bean: addCommand, field: 'addDailyDose')}"/>
      </td>
      <td class="value" style="vertical-align:middle;">
        <div id="addPrice" style="text-align:center;vertical-align:text-bottom">${formatNumber(number:addCommand?.addProductPrice, format:'#.##')}</div>
      </td>
      <td>&nbsp;</td>
      <td><g:submitToRemote controller="proforma" update="detailListPanel" action="addDetail" value="${message(code: 'add', 'default': 'Add')}"/></td>
      </tr>
    <g:each in="${proformaDetailList}" status="i" var="proformaDetail">
      <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
      <td valign="top" class="value">
      <g:hiddenField name="detailsIds[${i}]" value="${fieldValue(bean: proformaDetail, field: 'id')}"/>
      <g:select name="productIds[${i}]" from="${com.vitaflo.innova.Product.list()}" optionKey="id"
                value="${proformaDetail.product?.id}"
                noSelection="['':'Seleccione...']"
                onchange="${remoteFunction(controller:'proforma', action:'updatePrice',update:'addPrice_'+i, params:'\'addProductId=\'  + this.value')}"
                />
      </td>

      <td valign="top" class="value">
        <g:textField name="quantities[${i}]" value="${fieldValue(bean: proformaDetail, field: 'quantity')}"/>
      </td>

      <td valign="top" class="value">
        <g:textField name="dailyDoses[${i}]" value="${fieldValue(bean: proformaDetail, field: 'dailyDose')}"/>
      </td>
      <td class="value" style="vertical-align:middle;">
        <div id="addPrice_${i}" style="text-align:center;vertical-align:text-bottom">
          ${proformaDetail.product?formatNumber(number:proformaDetail?.productPrice, format:'#.##'):''}
        </div></td>
      <td>&nbsp;</td>
      <td><g:submitToRemote controller="proforma" update="detailListPanel" action="removeDetail" id="${i}" value="${message(code: 'remove', 'default': 'Remove')}"/></td>
      </tr>
    </g:each>
    </tbody>
  </table>
</div>