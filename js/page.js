/*
 * 客户端分页类
* @pageSize 每页显示记录数
* @tableID  分页表格ID
 * @tbodyID  分页表格TBODY的ID
 */ 
  
 /*
构造
*/ 
function PagingClass(pageSize,tableID,tbodyID) { 
     this._pageSize = pageSize; //每页最大记录数 
     this._tableId = tableID; 
     this._tBodyId = tbodyID; 
     this._rowCount = 0;//记录数 
     this.pageCount = 0;//页数 
     this.pageIndex = 0;//页索引 
     this._curTable = null;//表格引用 
     this._curTBody = null;//要分页内容 
     this._curRows = 0;//记录行引用 
     this._oldTBody = null; 
     this._initPaging(); //初始化; 
 }; 
  
 /*
初始化
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
下一页
*/ 
PagingClass.prototype.nextPage = function(){ 
     if(this.pageIndex + 1 < this.pageCount){ 
         this.pageIndex += 1; 
         this._updateTableRows_(); 
     } 
 }; 
  
 /*
上一页
*/ 
PagingClass.prototype.prePage = function(){ 
     if(this.pageIndex >= 1){ 
         this.pageIndex -= 1; 
         this._updateTableRows_(); 
     } 
 }; 
  
 /*
首页
*/ 
PagingClass.prototype.firstPage = function(){ 
     if(this.pageIndex != 0){ 
         this.pageIndex = 0; 
         this._updateTableRows_(); 
     }  
 }; 
  
 /*
尾页
*/ 
PagingClass.prototype.lastPage = function(){ 
     if(this.pageIndex+1 != this.pageCount){ 
         this.pageIndex = this.pageCount - 1; 
         this._updateTableRows_(); 
     } 
 }; 
  
 /*
页定位方法
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
执行分页时，更新显示表格内容
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
克隆原始操作行集合
*/ 
PagingClass.prototype._cloneRows_ = function(){ 
     var tempRows = []; 
     for(var i=0; i<this._curRows.length; i++){ 
         tempRows[i] = this._curRows[i].cloneNode(1); 
     } 
     return tempRows; 
 }; 