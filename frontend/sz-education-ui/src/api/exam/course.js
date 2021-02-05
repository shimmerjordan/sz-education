import request from '@/router/axios'

const baseCourseUrl = '/api/exam/v1/course/'

export function courseList () {
  return request({
    url: baseCourseUrl + 'courseList',
    method: 'get'
  })
}

export function fetchCourseList (query) {
  return request({
    url: baseCourseUrl + 'courseList',
    method: 'get',
    params: query
  })
}

export function getObj (id) {
  return request({
    url: baseCourseUrl + id,
    method: 'get'
  })
}

export function addObj (obj) {
  return request({
    url: baseCourseUrl,
    method: 'post',
    data: obj
  })
}

export function putObj (obj) {
  return request({
    url: baseCourseUrl,
    method: 'put',
    data: obj
  })
}

export function delObj (id) {
  return request({
    url: baseCourseUrl + id,
    method: 'delete'
  })
}

export function delAllObj (obj) {
  return request({
    url: baseCourseUrl + 'deleteAll',
    method: 'post',
    data: obj
  })
}
