class ClientSearcher < SimpleDelegator

  def search!(query)
    query_regex = /#{Regexp.escape(query.to_s)}/i
    query_number = query.present? ? query.gsub(/\D/, '').to_i : nil
    self.any_of(
      {last_name: query_regex},
      {number: query_number},
      {search_terms: query_regex}
    )
  end

end
