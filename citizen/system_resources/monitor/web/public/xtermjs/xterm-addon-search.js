!function(e,t){"object"==typeof exports&&"object"==typeof module?module.exports=t():"function"==typeof define&&define.amd?define([],t):"object"==typeof exports?exports.SearchAddon=t():e.SearchAddon=t()}(self,(function(){return(()=>{"use strict";var e={};return(()=>{var t=e;Object.defineProperty(t,"__esModule",{value:!0}),t.SearchAddon=void 0;var i=" ~!@#$%^&*()+`-=[]{}|\\;:\"',./<>?",r=function(){function e(){this._linesCacheTimeoutId=0}return e.prototype.activate=function(e){this._terminal=e},e.prototype.dispose=function(){},e.prototype.findNext=function(e,t){if(!this._terminal)throw new Error("Cannot use addon until it has been loaded");if(!e||0===e.length)return this._terminal.clearSelection(),!1;var i,r=0,n=0;if(this._terminal.hasSelection()){var o=!!t&&t.incremental;i=this._terminal.getSelectionPosition(),n=o?i.startRow:i.endRow,r=o?i.startColumn:i.endColumn}this._initLinesCache();var s={startRow:n,startCol:r},a=this._findInLine(e,s,t);if(!a)for(var l=n+1;l<this._terminal.buffer.active.baseY+this._terminal.rows&&(s.startRow=l,s.startCol=0,!(a=this._findInLine(e,s,t)));l++);if(!a&&0!==n)for(l=0;l<n&&(s.startRow=l,s.startCol=0,!(a=this._findInLine(e,s,t)));l++);return!a&&i&&(s.startRow=i.startRow,s.startCol=0,a=this._findInLine(e,s,t)),this._selectResult(a)},e.prototype.findPrevious=function(e,t){if(!this._terminal)throw new Error("Cannot use addon until it has been loaded");if(!e||0===e.length)return this._terminal.clearSelection(),!1;var i,r,n=!0,o=this._terminal.buffer.active.baseY+this._terminal.rows,s=this._terminal.cols,a=!!t&&t.incremental;this._terminal.hasSelection()&&(o=(r=this._terminal.getSelectionPosition()).startRow,s=r.startColumn),this._initLinesCache();var l={startRow:o,startCol:s};if(a?(i=this._findInLine(e,l,t,!1))&&i.row===o&&i.col===s||(r&&(l.startRow=r.endRow,l.startCol=r.endColumn),i=this._findInLine(e,l,t,!0)):i=this._findInLine(e,l,t,n),!i){l.startCol=Math.max(l.startCol,this._terminal.cols);for(var h=o-1;h>=0&&(l.startRow=h,!(i=this._findInLine(e,l,t,n)));h--);}if(!i&&o!==this._terminal.buffer.active.baseY+this._terminal.rows)for(h=this._terminal.buffer.active.baseY+this._terminal.rows;h>=o&&(l.startRow=h,!(i=this._findInLine(e,l,t,n)));h--);return!(i||!r)||this._selectResult(i)},e.prototype._initLinesCache=function(){var e=this,t=this._terminal;this._linesCache||(this._linesCache=new Array(t.buffer.active.length),this._cursorMoveListener=t.onCursorMove((function(){return e._destroyLinesCache()})),this._resizeListener=t.onResize((function(){return e._destroyLinesCache()}))),window.clearTimeout(this._linesCacheTimeoutId),this._linesCacheTimeoutId=window.setTimeout((function(){return e._destroyLinesCache()}),15e3)},e.prototype._destroyLinesCache=function(){this._linesCache=void 0,this._cursorMoveListener&&(this._cursorMoveListener.dispose(),this._cursorMoveListener=void 0),this._resizeListener&&(this._resizeListener.dispose(),this._resizeListener=void 0),this._linesCacheTimeoutId&&(window.clearTimeout(this._linesCacheTimeoutId),this._linesCacheTimeoutId=0)},e.prototype._isWholeWord=function(e,t,r){return(0===e||i.includes(t[e-1]))&&(e+r.length===t.length||i.includes(t[e+r.length]))},e.prototype._findInLine=function(e,t,i,r){var n;void 0===i&&(i={}),void 0===r&&(r=!1);var o=this._terminal,s=t.startRow,a=t.startCol,l=o.buffer.active.getLine(s);if(null==l?void 0:l.isWrapped)return r?void(t.startCol+=o.cols):(t.startRow--,t.startCol+=o.cols,this._findInLine(e,t,i));var h=null===(n=this._linesCache)||void 0===n?void 0:n[s];h||(h=this._translateBufferLineToStringWithWrap(s,!0),this._linesCache&&(this._linesCache[s]=h));var f=h[0],c=h[1],u=this._bufferColsToStringOffset(s,a),d=i.caseSensitive?e:e.toLowerCase(),_=i.caseSensitive?f:f.toLowerCase(),v=-1;if(i.regex){var g=RegExp(d,"g"),p=void 0;if(r)for(;p=g.exec(_.slice(0,u));)v=g.lastIndex-p[0].length,e=p[0],g.lastIndex-=e.length-1;else(p=g.exec(_.slice(u)))&&p[0].length>0&&(v=u+(g.lastIndex-p[0].length),e=p[0])}else r?u-d.length>=0&&(v=_.lastIndexOf(d,u-d.length)):v=_.indexOf(d,u);if(v>=0){if(i.wholeWord&&!this._isWholeWord(v,_,e))return;for(var C=0;C<c.length-1&&v>=c[C+1];)C++;for(var m=C;m<c.length-1&&v+e.length>=c[m+1];)m++;var w=v-c[C],L=v+e.length-c[m],b=this._stringLengthToBufferSize(s+C,w);return{term:e,col:b,row:s+C,size:this._stringLengthToBufferSize(s+m,L)-b+o.cols*(m-C)}}},e.prototype._stringLengthToBufferSize=function(e,t){var i=this._terminal.buffer.active.getLine(e);if(!i)return 0;for(var r=0;r<t;r++){var n=i.getCell(r);if(!n)break;var o=n.getChars();o.length>1&&(t-=o.length-1);var s=i.getCell(r+1);s&&0===s.getWidth()&&t++}return t},e.prototype._bufferColsToStringOffset=function(e,t){for(var i=this._terminal,r=e,n=0,o=i.buffer.active.getLine(r);t>0&&o;){for(var s=0;s<t&&s<i.cols;s++){var a=o.getCell(s);if(!a)break;a.getWidth()&&(n+=a.getChars().length)}if(r++,(o=i.buffer.active.getLine(r))&&!o.isWrapped)break;t-=i.cols}return n},e.prototype._translateBufferLineToStringWithWrap=function(e,t){for(var i,r=this._terminal,n=[],o=[0],s=r.buffer.active.getLine(e);s;){var a=r.buffer.active.getLine(e+1),l=!!a&&a.isWrapped,h=s.translateToString(!l&&t);if(l&&a){var f=s.getCell(s.length-1);f&&0===f.getCode()&&1===f.getWidth()&&2===(null===(i=a.getCell(0))||void 0===i?void 0:i.getWidth())&&(h=h.slice(0,-1))}if(n.push(h),!l)break;o.push(o[o.length-1]+h.length),e++,s=a}return[n.join(""),o]},e.prototype._selectResult=function(e){var t=this._terminal;if(!e)return t.clearSelection(),!1;if(t.select(e.col,e.row,e.size),e.row>=t.buffer.active.viewportY+t.rows||e.row<t.buffer.active.viewportY){var i=e.row-t.buffer.active.viewportY;i-=Math.floor(t.rows/2),t.scrollLines(i)}return!0},e}();t.SearchAddon=r})(),e})()}));
//# sourceMappingURL=xterm-addon-search.js.map