/*
 * �ͻ��˷�ҳ��
* @pageSize ÿҳ��ʾ��¼��
* @tableID  ��ҳ���ID
 * @tbodyID  ��ҳ���TBODY��ID
 */ 
  
 /*
����
*/ 
function PagingClass(pageSize,tableID,tbodyID) { 
     this._pageSize = pageSize; //ÿҳ����¼�� 
     this._tableId = tableID; 
     this._tBodyId = tbodyID; 
     this._rowCount = 0;//��¼�� 
     this.pageCount = 0;//ҳ�� 
     this.pageIndex = 0;//ҳ���� 
     this._curTable = null;//������� 
     this._curTBody = null;//Ҫ��ҳ���� 
     this._curRows = 0;//��¼������ 
     this._oldTBody = null; 
     this._initPaging(); //��ʼ��; 
 }; 
  
 /*
��ʼ��
*/ 
  
PagingClass.prototype._initPaging = function(){ 
     this._curTable = document.getElementById(this._tableId); 
     this._curTBody = this._curTable.tBodies[this._tBodyId]; 
     this._curRows = this._curTBody.rows; 
     this._rowCount = this._curRows.length; 
     try{ 
         this._pageSize = (this._pageSize <= 0) || (this._pageSize>this._rowCount) ? this._rowCount : this._pageSize;  
         this.pageCount = parseInt(this._rowCount%this._pageSize == 0 ? this._rowCount/this._pageSize : this._rowCount/this._pageSize+1); 
     } catch(exception){} 
  
     this._updateTableRows_(); 
 }; 
  
 /*
��һҳ
*/ 
PagingClass.prototype.nextPage = function(){ 
     if(this.pageIndex + 1 < this.pageCount){ 
         this.pageIndex += 1; 
         this._updateTableRows_(); 
     } 
 }; 
  
 /*
��һҳ
*/ 
PagingClass.prototype.prePage = function(){ 
     if(this.pageIndex >= 1){ 
         this.pageIndex -= 1; 
         this._updateTableRows_(); 
     } 
 }; 
  
 /*
��ҳ
*/ 
PagingClass.prototype.firstPage = function(){ 
     if(this.pageIndex != 0){ 
         this.pageIndex = 0; 
         this._updateTableRows_(); 
     }  
 }; 
  
 /*
βҳ
*/ 
PagingClass.prototype.lastPage = function(){ 
     if(this.pageIndex+1 != this.pageCount){ 
         this.pageIndex = this.pageCount - 1; 
         this._updateTableRows_(); 
     } 
 }; 
  
 /*
ҳ��λ����
*/ 
PagingClass.prototype.aimPage = function(iPageIndex){ 
     if(iPageIndex > this.pageCount-1){ 
         this.pageIndex = this.pageCount - 1; 
     } else if(iPageIndex < 0){ 
         this.pageIndex = 0; 
     }else{ 
         this.pageIndex = iPageIndex; 
     } 
     this._updateTableRows_(); 
 }; 
  
 /*
ִ�з�ҳʱ��������ʾ�������
*/ 
  
PagingClass.prototype._updateTableRows_ = function(){ 
     var iCurrentRowCount = this._pageSize * this.pageIndex; 
     var iMoreRow = this._pageSize+iCurrentRowCount > this._rowCount ? this._pageSize+iCurrentRowCount - this._rowCount : 0; 
     var tempRows = this._cloneRows_(); 
     var removedTBody = this._curTable.removeChild(this._curTBody); 
     var newTBody = document.createElement("TBODY"); 
     newTBody.setAttribute("id", this._tBodyId); 
  
     for(var i=iCurrentRowCount; i < this._pageSize+iCurrentRowCount-iMoreRow; i++){ 
         newTBody.appendChild(tempRows[i]); 
     } 
      
     this._curTable.appendChild(newTBody); 
  
     this._curRows = tempRows; 
     this._curTBody = newTBody; 
 }; 
  
 /*
��¡ԭʼ�����м���
*/ 
PagingClass.prototype._cloneRows_ = function(){ 
     var tempRows = []; 
     for(var i=0; i<this._curRows.length; i++){ 
         tempRows[i] = this._curRows[i].cloneNode(1); 
     } 
     return tempRows; 
 }; 