# frozen_string_literal: true

require 'spec_helper'

RSpec.describe NotifyHelper do
  using RSpec::Parameterized::TableSyntax

  describe 'merge_request_reference_link' do
    let(:project) { create(:project) }
    let(:merge_request) { create(:merge_request, source_project: project) }

    it 'returns link to merge request with the text reference' do
      url = "http://test.host/#{project.full_path}/-/merge_requests/#{merge_request.iid}"

      expect(merge_request_reference_link(merge_request)).to eq(reference_link(merge_request, url))
    end
  end

  describe 'issue_reference_link' do
    let(:project) { create(:project) }
    let(:issue) { create(:issue, project: project) }

    it 'returns link to issue with the text reference' do
      url = "http://test.host/#{project.full_path}/-/issues/#{issue.iid}"

      expect(issue_reference_link(issue)).to eq(reference_link(issue, url))
    end
  end

  describe '#invited_to_description' do
    where(:source, :description) do
      build(:project, description: nil) | /Projects are/
      build(:group, description: nil) | /Groups assemble/
      build(:project, description: '_description_') | '_description_'
      build(:group, description: '_description_') | '_description_'
    end

    with_them do
      specify do
        expect(helper.invited_to_description(source)).to match description
      end
    end

    it 'truncates long descriptions', :aggregate_failures do
      description = '_description_ ' * 30
      project = build(:project, description: description)

      result = helper.invited_to_description(project)
      expect(result).not_to match description
      expect(result.length).to be <= 200
    end
  end

  describe '#merge_request_approved_description' do
    let(:merge_request) { create(:merge_request) }
    let(:user) { create(:user) }
    let(:avatar_icon_for_user) { 'avatar_icon_for_user' }

    before do
      allow(helper).to receive(:avatar_icon_for_user).and_return(avatar_icon_for_user)
    end

    it 'returns MR approved description' do
      result = helper.merge_request_approved_description(merge_request, user)
      expect(result).to eq "<span style=\"font-weight: 600;color:#333333;\">Merge request</span> " \
       "#{
        link_to(merge_request.to_reference, merge_request_url(merge_request),
        style: "font-weight: 600;color:#3777b0;text-decoration:none")
      } " \
      "<span>was approved by</span> " \
      "#{
        content_tag(:img, nil, height: "24", src: avatar_icon_for_user,
                               style: "border-radius:12px;margin:-7px 0 -7px 3px;",
                               width: "24", alt: "Avatar", class: "avatar"
        )
      } " \
      "#{link_to(user.name, user_url(user), style: "color:#333333;text-decoration:none;", class: "muted")}"
    end
  end

  def reference_link(entity, url)
    "<a href=\"#{url}\">#{entity.to_reference}</a>"
  end
end
