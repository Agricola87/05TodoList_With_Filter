
<todo>

  <h3>{ opts.title }</h3>

  <ul>
    <li each={ itemsToShow}>
      <label class={ completed: done }>
        <input type="checkbox" checked={ done } onclick={ parent.toggle }> { title }
      </label>
    </li>
  </ul>

  <hr>

  <form onsubmit={ add }>
    <input ref="input" onkeyup={ edit }>
    <button disabled={ !text }>Add #{ itemsToShow.length + 1 }</button>

    <button type="button" disabled={ itemsToShow.length == 0 } onclick={ removeAllDone }>
    X{ items.filter(onlyDone).length } </button>
  </form>
  
<hr>

<button disabled={ opts.showMode == 'all' } 
  onclick={ showAll }>
  Show all</button>
<button type="button" disabled={ opts.showMode == 'onlyDone' } 
  onclick={ showOnlyDone }>
	Show done</button>
<button type="button" disabled={ opts.showMode == 'onlyUndone' } 
  onclick={ showOnlyUndone }>
	Show undone</button>
  

  <!-- this script tag is optional -->
  <script>
    this.items = opts.items
    opts.itemsToShow = opts.items
    this.itemsToShow = opts.itemsToShow

    edit(e) {
      this.text = e.target.value
    }

    add(e) {
      if (this.text) {
        this.items.push({ title: this.text })
        //this.itemsToShow.push({ title: this.text })
        this.text = this.refs.input.value = ''
      }
      e.preventDefault()
    }

    removeAllDone(e) {
      this.items = this.items.filter(function(item) {
        return !item.done
      })
    }

    onlyDone(item) {
      return item.done
    }

    toggle(e) {
      var item = e.item
      item.done = !item.done
      return true
    }
	
	showAll(e) {
	  opts.showMode = 'all'
    this.itemsToShow = this.items.filter(function(item) {
        return true
      })
	  e.preventDefault()
	}
	
	showOnlyDone(e) {
	  opts.showMode = 'onlyDone';
    this.itemsToShow = this.items.filter(function(item) {
        return item.done
      })
	  e.preventDefault()
	}
	
	showOnlyUndone(e) {
	  opts.showMode = 'onlyUndone'
    this.itemsToShow = this.items.filter(function(item) {
        return !item.done
      })
	  e.preventDefault()
	}
	
  </script>

</todo>
