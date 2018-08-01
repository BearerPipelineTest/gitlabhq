export const SET_API_SETTINGS = 'SET_API_SETTINGS';
export const RECEIVE_DELETE_LICENSE = 'RECEIVE_DELETE_LICENSE';
export const RECEIVE_DELETE_LICENSE_ERROR = 'RECEIVE_DELETE_LICENSE_ERROR';
export const RECEIVE_LOAD_MANAGED_LICENSES = 'RECEIVE_LOAD_MANAGED_LICENSES';
export const RECEIVE_LOAD_MANAGED_LICENSES_ERROR = 'RECEIVE_LOAD_MANAGED_LICENSES_ERROR';
export const RECEIVE_SET_LICENSE_APPROVAL = 'RECEIVE_SET_LICENSE_APPROVAL';
export const RECEIVE_SET_LICENSE_APPROVAL_ERROR = 'RECEIVE_SET_LICENSE_APPROVAL_ERROR';
export const RECEIVE_LOAD_LICENSE_REPORT = 'RECEIVE_LOAD_LICENSE_REPORT';
export const RECEIVE_LOAD_LICENSE_REPORT_ERROR = 'RECEIVE_LOAD_LICENSE_REPORT_ERROR';
export const REQUEST_DELETE_LICENSE = 'REQUEST_DELETE_LICENSE';
export const REQUEST_LOAD_MANAGED_LICENSES = 'REQUEST_LOAD_MANAGED_LICENSES';
export const REQUEST_SET_LICENSE_APPROVAL = 'REQUEST_SET_LICENSE_APPROVAL';
export const REQUEST_LOAD_LICENSE_REPORT = 'REQUEST_LOAD_LICENSE_REPORT';
export const SET_LICENSE_IN_MODAL = 'SET_LICENSE_IN_MODAL';
export const RESET_LICENSE_IN_MODAL = 'RESET_LICENSE_IN_MODAL';

// prevent babel-plugin-rewire from generating an invalid default during karma tests
export default () => {};
