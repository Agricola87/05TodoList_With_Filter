
<todo>

  <h3>{ opts.title }</h3>

  <ul>
    <li each={ items.filter(whatShow) }>
      <label class={ completed: done }>
        <input type="checkbox" checked={ done } onclick={ parent.toggle }> { title }
      </label>
    </li>
  </ul>

  <form onsubmit={ add }>
    <input ref="input" onkeyup={ edit }>
    <button disabled={ !text }>Add #{ items.filter(whatShow).length + 1 }</button>

    <button type="button" disabled={ items.filter(onlyDone).length == 0 } onclick={ removeAllDone }>
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

    edit(e) {
      this.text = e.target.value
    }

    add(e) {
      if (this.text) {
        this.items.push({ title: this.text })
        this.text = this.refs.input.value = ''
      }
      e.preventDefault()
    }

    removeAllDone(e) {
      this.items = this.items.filter(function(item) {
        return !item.done
      })
    }

    // an two example how to filter items on the list
    whatShow(item) {
	  if(opts.showMode == 'all')
	  {
	    return !item.hidden
	  }
	  if(opts.showMode == 'onlyDone')
	  {
	    return (!item.hidden) && (item.done)
	  }
	  if(opts.showMode == 'onlyUndone')
	  {
	    return (!item.hidden) && (!item.done)
	  }
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
	  e.preventDefault()
	}
	
	showOnlyDone(e) {
	  opts.showMode = 'onlyDone'
	  e.preventDefault()
	}
	
	showOnlyUndone(e) {
	  opts.showMode = 'onlyUndone'
	  e.preventDefault()
	}
	
  </script>

</todo>
