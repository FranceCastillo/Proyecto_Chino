<? $pdf = Yii::createComponent('application.extensions.MPDF52.mpdf');
 $dataProvider = $_SESSION['datos_filtrados']->getData();
 $contador=count($dataProvider);
 $html.='
 <table align="center"><tr>
 <td align="center"><b>LISTADO DE CONTRATOS</b></td>
 </tr></table>
 Total Resultados: '.$contador.'
 <table class="detail-view2" repeat_header="1" cellpadding="1" cellspacing="1"
width="100%" border="0">
 <tr class="principal">
 <td class="principal" width="7%">&nbsp;N° Control</td>
 <td class="principal" width="7%">&nbsp;N° Contrato</td>
 <td class="principal" width="19%">&nbsp;Empresa</td>
 <td class="principal" width="10%">&nbsp;Estado</td>
 <td class="principal" width="9%">&nbsp;Monto Contratado</td>
 <td class="principal" width="25%">&nbsp;Objeto Contrato</td>
 <td class="principal" width="14%">&nbsp;Personal Actuante</td>
 <td class="principal" width="9%">&nbsp;Tipo Informe</td>
 </tr>';
 $i=0;
 $val=count($dataProvider);
 while($i<$val){
 $html.='
 <tr class="odd">
 <td class="odd" width="7%">&nbsp;'.$dataProvider[$i]
["num_control"].'</td>
 <td class="odd" width="7%">&nbsp;'.$dataProvider[$i]
["num_contrato"].'</td>
 <td class="odd" width="19%">&nbsp;'.$dataProvider[$i]["empresa"].'</td>
 <td class="odd" width="10%">&nbsp;'.$dataProvider[$i]["estado0"]
["nombre_estado"].'</td>
 <td class="odd" width="9%">&nbsp;'.$dataProvider[$i]
["monto_contratado"].'</td>
 <td class="odd" width="25%">&nbsp;'.$dataProvider[$i]
["objeto_contrato"].'</td>
 <td class="odd" width="14%">&nbsp;'.$dataProvider[$i]
26
Guía Básica de Yii Framework
["personal_actuante"].'</td>
 <td class="odd" width="9%">&nbsp;'.$dataProvider[$i]["informe0"]
["nombre_tipo_informe"].'</td>
 ';
 $html.='</tr>'; $i++;
 }
 $html.='</table>';
 $mpdf=new mPDF('win-1252','LETTER-L','','',9,9,24,10,5,5);
 $mpdf->WriteHTML($html);
 $mpdf->Output('Reporte_Contratos.pdf','D');
 exit; ?>
