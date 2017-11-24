import dd from 'ddeyes'
import toolFuc from '../utils/helper'
import services from '../services'

export default local_service = ->
  # create todo
  results = await services.local.create toolFuc
  ,
    company: '湖北和风和乐旅游有限公司'
    main: '旅游'
    location: '武汉'
  dd results

  # fetch todo
  data_fetch = await services.local.fetch toolFuc
  ,
    objectId: results.objectId
  dd data_fetch

  # patch todo
  data_patch = await services.local.patch toolFuc
  ,
    objectId: results.objectId
    company: '湖北举手帮租有限公司'
    main: '租房'
    location: '武汉'
  data_patch
  dd data_patch

  # reload todos
  data_reload = await services.local.reload toolFuc
  dd data_reload

  # remove todo
  data_remove = await services.local.remove toolFuc
  ,
    objectId: data_patch.objectId
  dd data_remove

  # reload todos
  data_reload = await services.local.reload toolFuc
  data_reload
  dd data_reload

  # remove all
  ids = data_reload.results.reduce (r, c) ->
    [
      r...
      c.objectId
    ]
  , []
  for id in ids
    data_removeAll = await services.local.remove toolFuc
    ,
      objectId: id
    dd data_remove